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
alias tm='tmux new -Asmain'

# Path variable
export PATH="$HOME/.config/lsp/lua-language-server/bin:$PATH"
