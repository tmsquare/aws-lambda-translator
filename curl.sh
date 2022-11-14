#!/bin/bash

text="Enter a text"
target="fr"

if [ $# -eq 1 ]
then
  text=$1
elif [ $# -ge 2 ]
then
  text=$1
  target=$2
fi

curl -X POST https://mu3zjnxldh.execute-api.eu-west-1.amazonaws.com/default/tranlator -d '{"text": "'"$text"'" , "target_language": "'"$target"'" }'

echo

#alias translate='bash ./curl.sh'