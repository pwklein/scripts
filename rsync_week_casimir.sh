#!/bin/bash

DAY=$(date +%d)
ssh casimir8 << HERE
if [ -e "/home/labcpht/pmc/philipp.klein/osync-backup/$DAY" ] ; then
  rm -fr "/home/labcpht/pmc/philipp.klein/osync-backup/$DAY"
fi
HERE

rsync -az --quiet --delete --inplace --backup --backup-dir=$DAY $HOME/osync casimir8:/home/labcpht/pmc/philipp.klein/osync-backup/

python ~/scripts/telegram_bot_text.py 'Done daily backup to casimir'
