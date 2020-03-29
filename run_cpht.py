from termcolor import colored
from fabric import Connection
import subprocess
import os


def run_cpht(cur_dir):

    # input file, cluster and specifiy directory
    file_name = input(colored('*** Enter ipynb file name:  ', 'white'))
    cluster = input(colored('*** Casimir8 or enter cluster number [1-8]:  ', 'white'))
    dir_name = input(colored('*** Directory "data" or enter name:  ', 'white'))
    if cluster == '':
        cluster = 'casimir8'
    else:
        cluster = 'casimir'+cluster

    # if directory other than default ('data'), try to create directory
    if len(dir_name) > 0:
        subprocess.run(
            f'mkdir -p '+cur_dir+f'/data/{dir_name}', shell=True, stdout=subprocess.DEVNULL)

    # transform jupyter notebook to .py file and move into correct directory
    subprocess.run(
        f'cd '+cur_dir+f' && pwd && jupyter nbconvert --log-level WARN --to script {file_name}.ipynb', shell=True, stdout=subprocess.DEVNULL)
    if len(dir_name) > 0:
        subprocess.run(f'mv '+cur_dir+f'/{file_name}.py '+cur_dir+f'/data/{dir_name}/', shell=True, stdout=subprocess.DEVNULL)
    else:
        subprocess.run(f'mv '+cur_dir+f'/{file_name}.py '+cur_dir+f'/data/', shell=True, stdout=subprocess.DEVNULL)

    # sync local directory with remote directory (--delete removes content non-existent in local)
    print(colored('*** Sync started', 'white'))
    subprocess.run(f'rsync -av --delete --no-motd '+cur_dir+f'/data  {cluster}:~/ 2>&1 >/dev/null',
                   shell=True, stdout=subprocess.DEVNULL)
    print(colored('*** Sync done', 'white'))

    # connect to cluster
    print(colored('*** Connecting', 'white'))
    c = Connection(f'{cluster}')
    print(colored('*** Connected', 'white'))

    # run python script .py on cluster and save results
    print(colored('*** Running', 'white'))
    if len(dir_name) > 0:
        with c.cd(f'~/data/{dir_name}'):
            try:
                c.run(f'module load python/3.8.0-Tk && python3 ./{file_name}.py')
                print(colored('*** DONE', 'white'))
            except:
                print(colored('*** Execution failed', 'white'))
    else:
        with c.cd(f'~/data'):
            try:
                c.run(f'module load python/3.8.0-Tk && python3 ./{file_name}.py')
                print(colored('*** DONE', 'white'))
            except:
                print(colored('*** Execution failed', 'white'))

    # close connection to remote server
    c.close()
    print(colored('*** Closed', 'white'))

    # sync remote directory with local directory
    print(colored('*** Sync started', 'white'))
    subprocess.run(f'rsync -av {cluster}:~/data '+cur_dir+'/ 2>&1 >/dev/null',
                   shell=True, stdout=subprocess.DEVNULL)
    print(colored('*** Sync done', 'white'))

    # play sound to indicate the end of the script
    # os.system('afplay /System/Library/Sounds/Glass.aiff')

    # ask whether output figures shall be opened
    open_fig = input(colored('*** Open figure or enter any key  ', 'white'))
    if open_fig == '':
        try:
            if len(dir_name) > 0:
                subprocess.run(f'xdg-open '+cur_dir+f'/data/{dir_name}/fig.png', shell=True, stdout=subprocess.DEVNULL)
            else:
                subprocess.run(f'xdg-open '+cur_dir+f'/data/fig.png',
                               shell=True, stdout=subprocess.DEVNULL)
        except:
            print(colored('*** No figure to open', 'white'))
