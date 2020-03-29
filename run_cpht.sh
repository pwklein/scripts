#!/bin/bash

cur_dir=$(pwd)
cd ~/scripts
python3 -c "import run_cpht; run_cpht.run_cpht( '$(echo $cur_dir)' )"
rm -r __pycache__
