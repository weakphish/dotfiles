set -Ux EDITOR nvim

fish_vi_key_bindings

# Aliases
alias lg lazygit
alias tf terraform
alias phx "poetry run hx"
alias pnv "poetry run nvim"
alias dc "docker compose"

# iTerm integration
test -e {$HOME}/.iterm2_shell_integration.fish; and source {$HOME}/.iterm2_shell_integration.fish

# VS Code integration
string match -q "$TERM_PROGRAM" vscode
and . (code --locate-shell-integration-path fish)

# Pyenv 
pyenv init - | source
