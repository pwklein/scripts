#!/bin/bash

git_dir=${PWD##*/} 

git remote add gitups git@github.com:/pwklein/${git_dir}.git

git remote add ups pwk@galilei:/srv/git/${git_dir}.git
git remote set-url --add --push ups pwk@galilei:/srv/git/${git_dir}.git
git remote set-url --add --push ups git@github.com:pwklein/${git_dir}.git
