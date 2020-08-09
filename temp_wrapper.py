import subprocess
import time

for i in range(10000):
    subprocess.run('sensors | grep "Core"', shell=True)
    time.sleep(1)
