#!/bin/bash

git_dir=${PWD##*/} 

git remote add gitups git@github.com:/pwklein/${git_dir}.git

#git remote add ups pwk@galilei:/srv/git/${git_dir}.git
git remote set-url --add --push origin pwk@galilei:/srv/git/${git_dir}.git
git remote set-url --add --push origin git@github.com:pwklein/${git_dir}.git
