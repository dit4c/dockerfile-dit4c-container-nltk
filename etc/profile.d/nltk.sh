#!/bin/bash

_user="$(id -u -n)"

if [ "$_user" == "researcher" ]; then
  export DISPLAY=:99
  export NLTK_DATA=/mnt/shared/nltk_data
fi
