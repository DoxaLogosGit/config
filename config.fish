if status is-interactive
    # Commands to run in interactive sessions can go here
end
starship init fish | source
set -gx PATH $PATH ~/projects/Odin
set -gx PATH $PATH ~/.local/bin
alias ll "eza --icons --color=always --color-scale=all -l --git"

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end
