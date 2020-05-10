#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f ~/scripts/my_prompt.sh ]; then
    . ~/scripts/my_prompt.sh
fi


# ~/scripts/aliases.sh instead of adding them here directly

if [ -f ~/scripts/aliases.sh ]; then
    . ~/scripts/aliases.sh
fi

[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

export PATH=/opt/miniconda3/bin:$PATH
