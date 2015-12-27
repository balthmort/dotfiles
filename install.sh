#!/usr/bin/env bash

set -e
git clone --recursive https://github.com/balthmort/dotfiles.git
cd dotfiles && git remote 'set-url' --push origin git@github.com:balthmort/dotfiles.git

exec ./setup.sh
