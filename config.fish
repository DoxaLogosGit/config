if status is-interactive
    # Commands to run in interactive sessions can go here
end
starship init fish | source
set -gx NVM_DIR  ~/.nvm
set -gx PATH $PATH ~/projects/Odin ~/.local/bin ~/.local/bin/yubico-authenticator ~/projects/ols  ~/.cargo/bin ~/.nvm /opt/IDriveForLinux/bin
set -gx ODIN_ROOT  ~/projects/Odin
set -gx EDITOR nvim
set -gx ENABLE_TOOL_SEARCH true
alias ll "eza --icons --color=always --color-scale=all -l --git"
alias c "claude"
alias ac "/bin/bash claude_aws.sh"

set name_list $(string split "-" $(uname -r))

if string match -qi -- "WSL2" $name_list
    set -gx TERM xterm-256color
else
    set -gx TERM xterm-256color
end

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command bat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /home/jgatkinsn/.lmstudio/bin
# End of LM Studio CLI section


# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

mise activate fish | source
