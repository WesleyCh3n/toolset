
# shell color
PS1='(w)\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

export WTOOLSET_DIR=$(pwd)
export XDG_CONFIG_HOME=$WTOOLSET_DIR/config/
export PATH=$WTOOLSET_DIR/bin/:$PATH

export NVM_DIR="$XDG_CONFIG_HOME/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"
command -v yarn >/dev/null 2>&1 || {
  echo "yarn not found. try installing..."
  if command -v npm >/dev/null 2>&1
  then
    npm install -g yarn
  else
    echo "npm not found. please install node first and rerun the shell"
  fi
}

alias vi='nvim'
alias lg='lazygit'


