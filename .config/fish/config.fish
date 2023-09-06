set -Ux EDITOR hx

# Aliases
alias lg lazygit
alias tf terraform

# Vim mode
fish_key_bindings

# iTerm integration
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
