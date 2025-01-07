export WTOOLSET_DIR=$(pwd)
export XDG_CONFIG_HOME=$WTOOLSET_DIR/config/
export PATH=$WTOOLSET_DIR/bin/:$PATH

export NVM_DIR="$XDG_CONFIG_HOME/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"
command -v yarn >/dev/null 2>&1 || {
  echo "yarn not found. try installing..."
  npm install -g yarn
}

alias vi='nvim'
alias lg='lazygit'
