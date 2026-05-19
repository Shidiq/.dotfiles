function pdf2md
    set PROJECT_DIR /Users/shidiq/Developer/projects/pdf2md-app
    set BACKEND_PID_FILE /tmp/pdf2md_backend.pid
    set FRONTEND_PID_FILE /tmp/pdf2md_frontend.pid
    set BACKEND_LOG /tmp/pdf2md_backend.log
    set FRONTEND_LOG /tmp/pdf2md_frontend.log

    switch $argv[1]
        case start
            echo "Starting pdf2md..."

            # Backend
            if test -f $BACKEND_PID_FILE
                set old_pid (cat $BACKEND_PID_FILE)
                if kill -0 $old_pid 2>/dev/null
                    echo "Backend already running (pid $old_pid)"
                else
                    rm $BACKEND_PID_FILE
                end
            end

            if not test -f $BACKEND_PID_FILE
                cd $PROJECT_DIR/backend
                uv sync --quiet
                nohup uv run uvicorn app.main:app --reload > $BACKEND_LOG 2>&1 &
                echo $last_pid > $BACKEND_PID_FILE
                echo "Backend started (pid $last_pid) → http://localhost:8000"
                cd -
            end

            # Wait for backend
            echo -n "Waiting for backend"
            for i in (seq 1 20)
                if curl -s http://localhost:8000 > /dev/null 2>&1; or curl -s http://localhost:8000/docs > /dev/null 2>&1
                    echo " ready"
                    break
                end
                echo -n "."
                sleep 1
            end
            echo ""

            # Frontend
            if test -f $FRONTEND_PID_FILE
                set old_pid (cat $FRONTEND_PID_FILE)
                if kill -0 $old_pid 2>/dev/null
                    echo "Frontend already running (pid $old_pid)"
                else
                    rm $FRONTEND_PID_FILE
                end
            end

            if not test -f $FRONTEND_PID_FILE
                cd $PROJECT_DIR/frontend
                nohup npm run dev > $FRONTEND_LOG 2>&1 &
                echo $last_pid > $FRONTEND_PID_FILE
                echo "Frontend started (pid $last_pid) → http://localhost:3000"
                cd -
            end

            echo ""
            echo "Done. Use 'pdf2md logs' to tail logs."

        case stop
            echo "Stopping pdf2md..."

            if test -f $FRONTEND_PID_FILE
                set pid (cat $FRONTEND_PID_FILE)
                if kill -0 $pid 2>/dev/null
                    kill $pid
                    echo "Frontend stopped (pid $pid)"
                else
                    echo "Frontend not running"
                end
                rm $FRONTEND_PID_FILE
            else
                echo "Frontend not running"
            end

            if test -f $BACKEND_PID_FILE
                set pid (cat $BACKEND_PID_FILE)
                if kill -0 $pid 2>/dev/null
                    kill $pid
                    echo "Backend stopped (pid $pid)"
                else
                    echo "Backend not running"
                end
                rm $BACKEND_PID_FILE
            else
                echo "Backend not running"
            end

            # Kill any lingering uvicorn/next processes on those ports
            for pid in (lsof -ti :8000 2>/dev/null)
                kill $pid 2>/dev/null
            end
            for pid in (lsof -ti :3000 2>/dev/null)
                kill $pid 2>/dev/null
            end

        case status
            echo "=== pdf2md status ==="
            if test -f $BACKEND_PID_FILE
                set pid (cat $BACKEND_PID_FILE)
                if kill -0 $pid 2>/dev/null
                    echo "Backend:  running (pid $pid) → http://localhost:8000"
                else
                    echo "Backend:  stopped (stale pid)"
                end
            else
                echo "Backend:  stopped"
            end

            if test -f $FRONTEND_PID_FILE
                set pid (cat $FRONTEND_PID_FILE)
                if kill -0 $pid 2>/dev/null
                    echo "Frontend: running (pid $pid) → http://localhost:3000"
                else
                    echo "Frontend: stopped (stale pid)"
                end
            else
                echo "Frontend: stopped"
            end

        case logs
            if test "$argv[2]" = backend
                tail -f $BACKEND_LOG
            else if test "$argv[2]" = frontend
                tail -f $FRONTEND_LOG
            else
                echo "--- Backend log ($BACKEND_LOG) ---"
                tail -20 $BACKEND_LOG 2>/dev/null; or echo "(no log)"
                echo ""
                echo "--- Frontend log ($FRONTEND_LOG) ---"
                tail -20 $FRONTEND_LOG 2>/dev/null; or echo "(no log)"
            end

        case '*'
            echo "Usage: pdf2md [start|stop|status|logs [backend|frontend]]"
    end
end
