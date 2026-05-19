function mkv2m4a --description "Extract audio from MKV to M4A"
    if test (count $argv) -lt 1
        echo "Usage: mkv2m4a INPUT.mkv [OUTPUT.m4a]"
        return 1
    end

    set input $argv[1]

    if test (count $argv) -ge 2
        set output $argv[2]
    else
        set output (string replace -r '\.mkv$' '' $input).m4a
    end

    ffmpeg -i $input -vn -acodec copy $output
end
