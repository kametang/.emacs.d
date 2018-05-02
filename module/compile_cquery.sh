#!/bin/sh

BACKDIR=$PWD

BASEDIR=$(dirname $(readlink -f $0))/cquery

cd $BASEDIR

./waf configure

CXX="$BASEDIR/build/clang+llvm-6.0.0-x86_64-linux-gnu-ubuntu-14.04/bin/clang++" \
   CXXFLAGS="-stdlib=libc++"  \
   LDFLAGS="-lc++"  \
   ./waf configure \
   --llvm-config=$BASEDIR/build/clang+llvm-6.0.0-x86_64-linux-gnu-ubuntu-14.04/bin/llvm-config build

cd $BACKDIR
