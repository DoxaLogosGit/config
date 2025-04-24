if status is-interactive
    # Commands to run in interactive sessions can go here
end
starship init fish | source
set -gx PATH $PATH ~/projects/Odin
set -gx PATH $PATH ~/.local/bin
alias ll "eza --icons --color=always --color-scale=all -l --git"
