set -Ux EDITOR nvim

# Aliases
alias lg lazygit
alias tf terraform
alias phx "poetry run hx"
alias pnv "poetry run nvim"
alias dc "docker compose"

# Vim mode
fish_vi_key_bindings

# iTerm integration
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# Pyenv 
pyenv init - | source
