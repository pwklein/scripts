#!/bin/bash

DAY=$(date +%d)
ssh harrer << HERE
if [ -e "$HOME/osync-backup/$DAY" ] ; then
  rm -fr "$HOME/osync-backup/$DAY"
fi
HERE

rsync -az --quiet --delete --inplace --backup --backup-dir=$DAY $HOME/osync harrer:$HOME/osync-backup/

python ~/scripts/telegram_bot_text.py 'Done with daily backup to harrer'
