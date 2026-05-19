# pyenv
set -gx PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT/bin
pyenv init - | source

# Homebrew
if test -f /opt/homebrew/bin/brew
    eval "$(/opt/homebrew/bin/brew shellenv)"
end

# Aliases
alias ll='ls -lah'
alias gs='git status'
alias gp='git push'
alias gl='git pull'
alias jl='jupyter lab'
export PATH="$HOME/.local/bin:$PATH"

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

# ============= Python Environment ===========================
# Default: langsung jalan dari global (workflow utama kamu)
# alias jlab sudah tidak perlu karena langsung pakai `jupyter lab`

# Kalau sesekali mau launch dari dalam venv tertentu:
alias jlab-geo "source ~/.venvs/geofisika/bin/activate.fish; and jupyter lab"
alias jlab-ml "source ~/.venvs/ml-general/bin/activate.fish; and jupyter lab"

# Activate venv shortcuts
alias venv-geo "source ~/.venvs/geofisika/bin/activate.fish"
alias venv-ml "source ~/.venvs/ml-general/bin/activate.fish"
alias venv-pinn "source ~/.venvs/pinn/bin/activate.fish"
alias deact deactivate

# PINN Env
set -x DDE_BACKEND pytorch
# Added by Antigravity
fish_add_path /Users/shidiq/.antigravity/antigravity/bin

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# open via coteditor
alias cot='open -a CotEditor'

# Tambah ke ~/.config/fish/config.fish
alias vault="fish ~/scripts/vault.fish"
alias !vault="tmux kill-session -t vault"

# Oh-My-Post
oh-my-posh init fish | source
oh-my-posh init fish --config ~/.poshthemes/catppuccin_mocha.omp.json | source
set -g fish_greeting ""

# Obsidian vault
set VAULT ~/Documents/Second\ Brain

function cap
    set timestamp (date "+%Y-%m-%d %H:%M")
    set filename $VAULT/00-Inbox/(date "+%Y%m%d%H%M%S").md

    if test (count $argv) -gt 0
        printf "# %s\n\n*Captured: %s*\n" "$argv" "$timestamp" >$filename
        echo "Saved: $filename"
    else
        hx $filename
    end
end

# ~/.config/fish/config.fish

function obs
    set vault $VAULT
    switch $argv[1]
        case search s
            if test (count $argv) -gt 1
                # ada keyword: filter dulu dengan rg
                set selected (rg --glob "*.md" -l "$argv[2]" $vault | \
                    fzf --preview "bat --color=always {}")
            else
                # tanpa keyword: tampil semua, preview isi
                set selected (fd --extension md . $vault | \
                    fzf --preview "bat --color=always {}")
            end
            if test -n "$selected"
                hx $selected
            end
        case '*'
            set selected (fd --extension md . $vault | \
                fzf --preview "bat --color=always {}")
            if test -n "$selected"
                hx $selected
            end
    end
end

# split tmux
function obsview
    if test -z "$TMUX"
        echo "Jalankan dari dalam tmux session"
        return 1
    end

    set vault $VAULT
    set selected (fd --extension md . $vault | \
        fzf --preview "bat --color=always {}")

    if test -n "$selected"
        tmux split-window -h "PAGER='less -R' glow -p '$selected'"
        hx $selected
    end
end
