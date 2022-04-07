if status is-interactive
    # Commands to run in interactive sessions can go here
end
function fish_greeting
	fortune | cowsay -f flaming-sheep| lolcat
end

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

