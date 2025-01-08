#!/bin/bash
set -euo pipefail

BIN_DIR="bin"

# Function to install a binary from a tar.gz release
install_tool() {
  local name=$1 # binary name
  local version=$2
  local url_template=$3
  local path_template=$4

  echo "Installing $name version $version..."

  local url=$(echo "$url_template" | sed "s/{{VERSION}}/$version/g")
  local path=$(echo "$path_template" | sed "s/{{VERSION}}/$version/g")
  local tar_file="${name}-${version}.tar.gz"

  curl -# -L "$url" -o "$tar_file"

  tar xf "$tar_file" \
    --strip-components=$(echo "$path" | tr -cd '/' | wc -c) \
    "$path"
  mv "$name" "$BIN_DIR/$name"
  rm "$tar_file"

  echo "$name installed successfully."
}

main() {
  source ./bashrc

  # install nvm & node
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
  source ./bashrc
  nvm install --lts

  install_tool "fd" "10.2.0" \
    "https://github.com/sharkdp/fd/releases/download/v{{VERSION}}/fd-v{{VERSION}}-x86_64-unknown-linux-musl.tar.gz" \
    "fd-v{{VERSION}}-x86_64-unknown-linux-musl/fd"

  install_tool "rg" "14.1.1" \
    "https://github.com/BurntSushi/ripgrep/releases/download/{{VERSION}}/ripgrep-{{VERSION}}-x86_64-unknown-linux-musl.tar.gz" \
    "ripgrep-{{VERSION}}-x86_64-unknown-linux-musl/rg"

  install_tool "lazygit" "0.44.1" \
    "https://github.com/jesseduffield/lazygit/releases/download/v{{VERSION}}/lazygit_{{VERSION}}_Linux_x86_64.tar.gz" \
    "lazygit"

  # install neovim
  curl -# -LO "https://github.com/neovim/neovim/releases/download/v0.10.3/nvim-linux64.tar.gz"
  tar xf nvim-linux64.tar.gz --strip-components=1
  rm nvim-linux64.tar.gz

  # employ nvim config
  git clone https://github.com/WesleyCh3n/dotfiles.git
  cp -r dotfiles/.config/nvim/ ./config/
  rm -r dotfiles
}

main
