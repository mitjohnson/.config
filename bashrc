
# Bash prompt
PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")'; 
PS1='\[$(tput setaf 130)\]\u\[$(tput setaf 7)\]@\[$(tput setaf 7)\]\h \[$(tput setaf 31)\]\w\[$(tput sgr0)\]${PS1_CMD1} \\$ '

# alias

# Use NVIM
alias nvim="~/.local/bin/nvim-linux64/bin/nvim"

# custom bash behavior
alias ls="ls --color=auto"
alias la="ls -a"

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'



export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export KUBECONFIG=~/.kube/config
. <(kubectl completion bash)
