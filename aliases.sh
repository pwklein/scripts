#!/bin/bash

#my aliases
alias py='python3'
alias backup-cpht='~/scripts/backup.sh'
alias push-cpht='~/scripts/push_cpht.sh'
alias pull-cpht='~/scripts/pull_cpht.sh'
alias run-cpht='~/scripts/run_cpht.sh'
alias save-cpht='~/scripts/save_cpht.sh'
alias restore-cpht='~/scripts/restore_cpht.sh'
alias my-jt='~/scripts/jupyterthemes.sh'
alias del='trash-put'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias l='ls -CF1'
alias la='ls -A1'
alias ll='ls -alF1'
alias zt='tabbed -c zathura -e &'
alias gits='git status'
alias cdf='cd $HOME && cd "$(find -type d | fzf --height=20% --border --layout=reverse)" && echo $(pwd)'
alias vimf='find ~/. -type f | fzf --height=20% --border --layout=reverse | xargs -ro -d "\n" vim'
alias catf='find ~/. -type f | fzf --height=20% --border --layout=reverse | xargs cat'
alias mvf='mv -t $(find ~/. -type d | fzf --height=20% --header="Destination directory:" --border --layout=reverse) $(find ~/. |
fzf -m --height=20% --border --header="Files/directories to move" --layout=reverse)'
alias cpf='cp -rt $(find ~/. -type d | fzf --height=20% --header="Destination directory:" --border --layout=reverse) $(find ~/. |
fzf -m --height=20% --border --header="Files/directories to copy" --layout=reverse)'
alias sbashrc='source ~/.bashrc'
alias zt='zathura --fork "$(find ~/. -type f -iname "*.pdf" | fzf --border --layout=reverse --height=20%)"'
alias lsf='ls -alF1 "$(find -type d | fzf --height=20% --border --layout=reverse)"'
alias jup='jupyter-notebook "$(find ~/. -type f -iname "*.ipynb" | fzf --border --layout=reverse --height=20%)"'
alias jupn='jupyter-notebook'
alias delf='trash-put $(find . -maxdepth 1 | fzf -m --border --height=20% --layout=reverse)'
alias ytdl_mp3='youtube-dl --ignore-errors --format bestaudio --extract-audio --audio-format mp3 --audio-quality 160K --output "%(title)s.%(ext)s" --yes-playlist'
alias weather='curl wttr.in'
