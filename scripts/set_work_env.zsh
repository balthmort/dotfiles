#!/usr/bin/env zsh
# 
# File:         set_work_env.sh
# Author:       Petr Sury
# Description:  Siple script to prepare working environmnet
#               Gets kerberos ticket, sets monitors...
source ~/System/dotfiles/zsh/specific.d/colorized_echo.zsh
COMPANY=""
cecho g "Set working environment" >&2
while getopts ":cEt" opt; do
  case $opt in
    c)
      cecho y "Setting CzechGlobe" >&2
      COMPANY="CG"
      ;;
    E)
      cecho y "Ending session" >&2
      xrandr --output DVI-I-2-1 --off
      xrandr --output DVI-I-3-2 --off
      kdestroy
      exit 0
      ;;
    t)
      cecho y "Ticket only" >&2
      COMPANY="T"
      ;;
    \?)
      cecho r "Invalid option: -$OPTARG" >&2
      ;;
  esac
done

[[ -z $COMPANY ]] && cecho r "Env not set" >&2 && exit 1

if [[ $COMPANY == "CG" ]]; then
  cecho y "Preparing monitors" >&2
  xrandr --auto
  xrandr --output DVI-I-2-1 --pos 0x0 --output DVI-I-3-2 --pos 1920x0 --output eDP-1 --pos 960x1080
  xrandr | grep DVI-I-2-1 | grep disconnected
  if [ $? -eq 1 ]; then
    cecho g "Done" >&2
  else
    cecho r "Monitors setting failed!" >&2
  fi

  cecho y "Acquiring Kerberos ticket" >&2
  cat ~/.kerb_pass_CG | kinit sury.p@CZECHGLOBE.CZ
  if [ $? -eq 0 ]; then
    cecho g "Done" >&2
  else
    cecho r "Ticket cannot be acquired" >&2
  fi
elif
  [[ $COMPANY == "T" ]]; then
  cecho y "Acquiring Kerberos ticket" >&2
  cat ~/.kerb_pass_CG | kinit sury.p@CZECHGLOBE.CZ
  if [ $? -eq 0 ]; then
    cecho g "Done" >&2
  else
    cecho r "Ticket cannot be acquired" >&2
  fi

fi


