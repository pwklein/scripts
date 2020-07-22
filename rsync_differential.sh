#!/bin/bash

DAY=$(date +%M)

ssh harrer '
if [ -e $HOME/box-backup/incr/$DAY ] ; then
  rm -fr $HOME/box-backup/incr/$DAY
fi
'

rsync -a --delete --quiet --inplace --backup --backup-dir=$DAY piper:$HOME/testf $HOME/box/
