# Prompt
PROMPT='%F{blue}%~%f %F{magenta}>%f '

# Aliases
# Colored output
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Convenience
alias ll='ls -alh'
alias v='nvim'
alias spm='sudo pacman'
alias gs='git status'

# Scripts
for script in `ls $HOME/.scripts`
do 
    source $script
done

# Plugins
source $HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
