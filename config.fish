if status is-interactive
    # Commands to run in interactive sessions can go here
end
starship init fish | source
set -gx PATH $PATH ~/projects/Odin ~/.local/bin ~/projects/ols 
set -gx ODIN_ROOT  ~/projects/Odin
set -gx EDTIOR nvim
alias ll "eza --icons --color=always --color-scale=all -l --git"

set name_list $(string split "-" $(uname -r))

if string match -qi -- "WSL2" $name_list
    set -gx TERM linux
end

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command bat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end
