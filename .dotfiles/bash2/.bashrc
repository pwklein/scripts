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

