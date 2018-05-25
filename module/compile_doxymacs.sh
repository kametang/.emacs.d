#!/bin/sh

BACKDIR=$PWD

BASEDIR=$(dirname $(readlink -f $0))/doxymacs-code

cd $BASEDIR

./bootstrap
./configure

cd $BACKDIR
