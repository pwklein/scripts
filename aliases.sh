#!/bin/bash

#my aliases

alias ..='cd ..'
alias backup-cpht='~/scripts/backup.sh'
alias catf='find ~/. -type f | fzf --height=20% --border --layout=reverse | xargs cat'
alias cdf='cd $HOME && cd "$(find -type d | fzf --height=20% --border --layout=reverse)" && echo $(pwd)'
alias compress-pdf='gs -sDEVICE=pdfwrite -dPDFSETTINGS=/ebook -o'
alias conda-export='~/scripts/conda_export.sh'
alias cpf='cp -rt $(find ~/. -type d | fzf --height=20% --header="Destination directory:" --border --layout=reverse) $(find ~/. | fzf -m --height=20% --border --header="Files/directories to copy" --layout=reverse)'
alias deac='conda deactivate'
alias del='trash-put'
alias delf='trash-put $(find . -maxdepth 1 | fzf -m --border --height=20% --layout=reverse)'
alias demount='cd && sudo umount /mnt'
alias egrep='egrep --color=auto'
alias enf='conda activate $(ls ~/tools/miniconda/envs/ | fzf --height=5% --border --layout=reverse)'
alias fgrep='fgrep --color=auto'
alias gits='git status'
alias grep='grep --color=auto'
alias jup='jupyter-notebook "$(find ~/. -type f -iname "*.ipynb" | dmenu -c -l 10)" &>/dev/null &'
alias jupn='jupyter-notebook &>/dev/null &'
alias l='colorls -1'
alias la='colorls -a'
alias ll='colorls -al'
alias mountf='sudo mount $(find /dev/sd* | fzf --height=10% --layout=reverse --border) /mnt/ && cd /mnt && colorls -a'
alias mvf='mv -t $(find ~/. -type d | fzf --height=20% --header="Destination directory:" --border --layout=reverse) $(find ~/. | fzf -m --height=20% --border --header="Files/directories to move" --layout=reverse)'
alias my-jt='~/scripts/jupyterthemes.sh'
alias pac-si='pacman -Slq | fzf --border --height=25% --layout=reverse --multi --preview "pacman -Si {1}" | xargs -ro sudo pacman -S'
alias paclist='~/scripts/paclist.sh'
alias pull-cpht='~/scripts/pull_cpht.sh'
alias push-cpht='~/scripts/push_cpht.sh'
alias py='python3'
alias qm='~/scripts/quickmarks_dmenu.sh'
alias remove-orphans='sudo pacman -Rns $(pacman -Qtdq)'
alias restore-cpht='~/scripts/restore_cpht.sh'
alias run-cpht='~/scripts/run_cpht.sh'
alias save-cpht='~/scripts/save_cpht.sh'
alias sbash='source ~/.bashrc'
alias sshf='~/scripts/ssh_fzf.sh'
alias szsh='source ~/.zshrc'
alias temp='~/scripts/temperature.sh'
alias tree2='colorls --tree=2'
alias v='nvim'
alias vimf='find ~/. -type f | fzf --height=20% --border --layout=reverse | xargs -ro -d "\n" nvim'
alias vpip='$(echo $CONDA_PREFIX/bin/pip)'
alias vpython='$(fcho $CONDA_PREFIX/bin/python)'
alias weather='curl wttr.in'
alias x='exit'
alias yay-si='yay -Slq | fzf --border --height=25% --layout=reverse --multi --preview "yay -Si {1}" | xargs -ro yay -S'
alias ytdl_mp3='youtube-dl --ignore-errors --format bestaudio --extract-audio --audio-format mp3 --audio-quality 160K --output "%(title)s.%(ext)s" --yes-playlist'
alias z='zathura'
alias zd='~/scripts/zathura_dmenu.sh'
alias zf='~/scripts/zathura_fzf.sh'
