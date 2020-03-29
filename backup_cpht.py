import subprocess
from termcolor import colored
import os

# sync local directory with remote directory (--delete removes content non-existent in local)
print(colored('*** Sync started', 'white'))
subprocess.run(f'rsync -avz --delete --backup --backup-dir="x_date_$(date +\\%Y-\\%m-\\%d)_time_$(date +\\%H-\\%M-\\%S) " ~/ownCloud casimir6:~/backup/ ',
               shell=True)
os.system('afplay /System/Library/Sounds/Glass.aiff')
print(colored('*** Sync done', 'white'))
