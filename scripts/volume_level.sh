#!/usr/bin/env bash

state=`amixer get Master | awk 'NR==6 {gsub(/\[|\]/, ""); 1; print $6}'`
vol=`amixer get Master | awk 'NR==6 {gsub(/\[|\]/, ""); 1; print $5}'`

if [ $state == "on" ];
then
  echo $vol
else
  echo "muted"
fi
