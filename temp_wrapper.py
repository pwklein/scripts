import subprocess
import time

for i in range(10000):
    subprocess.run('~/dotfiles/i3wm/.config/i3/blocks/temperature', shell=True)
    time.sleep(1)
