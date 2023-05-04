if status is-interactive
    fish_vi_key_bindings
end

set -Ux EDITOR nvim
alias lg lazygit

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

