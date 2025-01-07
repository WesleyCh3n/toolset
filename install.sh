#!/bin/bash
set -e

# install nvm & node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
nvm install --lts
source ./bashrc

# install fd
wget https://github.com/sharkdp/fd/releases/download/v10.2.0/fd-v10.2.0-x86_64-unknown-linux-musl.tar.gz
tar xf fd-v10.2.0-x86_64-unknown-linux-musl.tar.gz --strip-components=1 fd-v10.2.0-x86_64-unknown-linux-musl/fd
mv fd bin/fd

# install ripgrep
wget https://github.com/BurntSushi/ripgrep/releases/download/14.1.1/ripgrep-14.1.1-x86_64-unknown-linux-musl.tar.gz
tar xf ripgrep-14.1.1-x86_64-unknown-linux-musl.tar.gz --strip-components=1 ripgrep-14.1.1-x86_64-unknown-linux-musl/rg
mv rg bin/rg

# install nvim
