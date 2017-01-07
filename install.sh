#!/bin/sh
cargo install rustfmt
cargo install racer
cargo install ripgrep
git submodule init
git submodule update
cd doxymacs-code
./bootstrap
./configure
make
