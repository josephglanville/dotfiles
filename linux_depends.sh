#!/bin/bash

echo "Installing Linux dependencies"

# XXX assume ubuntu for now
packages=(
  "apt-transport-https"
  "libx11-xcb1"
  "neovim"
  "software-properties-common"
  "wget"
  "zsh"
)

sudo apt-get update
sudo apt-get install -qy --fix-missing "${packages[@]}"

keys=(
  # Microsoft release key: vscode
  "BC528686B50D79E339D3721CEB3E94ADBE1229CF"
  # Google release key: kubernetes
  "54A647F9048D5688D7DA2ABE6A030B21BA07F4FB"
)

sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 "${keys[@]}"

repos=(
  "deb https://apt.kubernetes.io/ kubernetes-xenial main"
  "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
)

for repo in "${repos[@]}"; do
  sudo add-apt-repository --no-update "${repo}"
done

sudo apt-get update

external_packages=(
  "kubectl"
  "code"
)

sudo apt-get install -qy --fix-missing "${external_packages[@]}"
