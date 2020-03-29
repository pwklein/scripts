from termcolor import colored
from fabric import Connection
import subprocess
from time import *
import os

def run_cpht():
    file_name = input(colored('#### Enter ipynb file name:  ','red'))
    cluster = input(colored('#### Casimir8 or enter cluster:  ','red'))
    dir_name = input(colored('#### Directory data_0 or enter name:  ','red'))
    if cluster=='':
        cluster='casimir8'
    if dir_name=='':
        dir_name='data_0'
    subprocess.run('jupyter nbconvert --to script {}.ipynb'.format('test'), shell=True)
    subprocess.run('mkdir {}'.format(dir_name), shell=True)
    print(colored('#### Connecting','blue'))
    c = Connection('{}'.format(cluster))
    print(colored('#### Connected','blue'))
    with c.cd('~/pwk'):
        try:
            c.run('mkdir {}'.format(dir_name),hide=True)
        except:
            print(colored('#### Directory already exists','blue'))
    print(colored('#### Upload','blue'))
    c.put('{}.py'.format(file_name), 'pwk/{}/{}.py'.format(dir_name,file_name))
    subprocess.run('rm {}.py'.format(file_name), shell=True)
    print(colored('#### Running','green'))
    with c.cd('~/pwk/{}'.format(dir_name)):
        try:
            c.run('module load python/3.8.0-Tk && python3 ./{}.py'.format(file_name))
        except:
            print('#### Python module not loaded, execution failed')
    print(colored('#### DONE','red'))
    try:
        c.get('pwk/{}/data.csv'.format(dir_name),'{}/data.csv'.format(dir_name))
        c.get('pwk/{}/fig.png'.format(dir_name),'{}/fig.png'.format(dir_name))
        print(colored('#### Download','blue'))
    except:
        print(colored('#### Download unsuccessful','blue'))
    c.run('exit')
    print(colored('#### Exit','blue'))
    try:
        subprocess.run('open {}/fig.png'.format(dir_name),shell=True)
    except:
        print(colored('#### No file to open','blue'))
    os.system('afplay /System/Library/Sounds/Glass.aiff')

run_cpht()