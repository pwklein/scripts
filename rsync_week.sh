#!/bin/bash

DAY=$(date +%A)
ssh harrer << HERE
if [ -e "$HOME/osync-backup/$DAY" ] ; then
  rm -fr "$HOME/osync-backup/$DAY"
fi
echo  "$HOME/osync-backup/$DAY"
HERE

rsync -az --quiet --delete --inplace --backup --backup-dir=$DAY $HOME/osync harrer:$HOME/osync-backup/

python ~/scripts/telegram_bot_text.py 'Done backing up data (script on a week)'
