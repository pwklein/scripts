#!/bin/bash

DAY=$(date +%M)

if [ -e $HOME/box-backup/incr/$DAY ] ; then
  rm -fr $HOME/box-backup/incr/$DAY
fi

rsync -a --delete --quiet --inplace --backup --backup-dir=$HOME/box-backup/incr/$DAY piper:$HOME/testf/ $HOME/box-backup/full
