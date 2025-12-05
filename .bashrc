#! /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]]; then
  # Shell is non-interactive.  Be done now!
  return
fi

export QT_QPA_PLATFORMTHEME=qt5ct

# Put your fun stuff here.
alias nvim='/home/thiago/Downloads/nvim-linux-x86_64/bin/nvim'
alias connect_db='cloudflared access tcp --hostname database.thiagohome.com --url localhost:3306'
eval "$(starship init bash)"
eval "$(fzf --bash)"
