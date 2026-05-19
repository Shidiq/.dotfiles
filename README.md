# dotfiles

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## What's inside

| Path | Maps to | Description |
|------|---------|-------------|
| `dot_config/fish/` | `~/.config/fish/` | Fish shell config, plugins, functions |
| `dot_config/ghostty/` | `~/.config/ghostty/` | Ghostty terminal config + themes |
| `dot_config/helix/` | `~/.config/helix/` | Helix editor config + custom themes |
| `dot_tmux.conf` | `~/.tmux.conf` | tmux config |

## Quick start

### Fresh install

```sh
# Install chezmoi and apply dotfiles in one shot
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply shidiq
```

### Existing chezmoi install

```sh
chezmoi init https://github.com/shidiq/dotfiles.git
chezmoi apply
```

## Tools required

- [Fish shell](https://fishshell.com/)
- [Fisher](https://github.com/jorgebucaran/fisher) — Fish plugin manager
- [Ghostty](https://ghostty.org/) — terminal
- [Helix](https://helix-editor.com/) — editor
- [tmux](https://github.com/tmux/tmux)
- [oh-my-posh](https://ohmyposh.dev/) — prompt (Catppuccin Mocha theme)
- [Homebrew](https://brew.sh/)
- [pyenv](https://github.com/pyenv/pyenv)
- [bun](https://bun.sh/)
- [OrbStack](https://orbstack.dev/)
- [fzf](https://github.com/junegunn/fzf), [fd](https://github.com/sharkdp/fd), [ripgrep](https://github.com/BurntSushi/ripgrep), [bat](https://github.com/sharkdp/bat), [glow](https://github.com/charmbracelet/glow)

## Fish plugins

Managed via Fisher, listed in `dot_config/fish/fish_plugins`:

| Plugin | Purpose |
|--------|---------|
| `jorgebucaran/fisher` | Plugin manager |
| `edc/bass` | Run bash scripts in Fish |
| `jorgebucaran/nvm.fish` | Node version manager |
| `jethrokuan/z` | Directory jumper |
| `patrickf1/fzf.fish` | fzf key bindings for Fish |

Install after applying dotfiles:

```sh
fisher update
```

## Key aliases & functions

| Alias/Function | Action |
|----------------|--------|
| `ll` | `ls -lah` |
| `gs` / `gp` / `gl` | git status / push / pull |
| `jl` | Launch Jupyter Lab |
| `jlab-geo` / `jlab-ml` | Jupyter in specific venv |
| `venv-geo` / `venv-ml` / `venv-pinn` | Activate Python venvs |
| `cot <file>` | Open in CotEditor |
| `cap [title]` | Capture note to Obsidian inbox |
| `obs [search] [keyword]` | Fuzzy-search Obsidian vault, open in Helix |
| `obsview` | tmux split: Glow preview + Helix |
| `vault` | Launch vault tmux session |

## tmux bindings

Prefix: `Ctrl+a`

| Key | Action |
|-----|--------|
| `prefix \|` | Horizontal split |
| `prefix -` | Vertical split |
| `prefix h/j/k/l` | Navigate panes |
| `prefix H/J/K/L` | Resize panes |

## Managing dotfiles

```sh
# Add a new file
chezmoi add ~/.config/someapp/config

# Edit a tracked file
chezmoi edit ~/.config/fish/config.fish

# See what would change before applying
chezmoi diff

# Apply changes to home directory
chezmoi apply

# Pull latest and apply
chezmoi update
```
