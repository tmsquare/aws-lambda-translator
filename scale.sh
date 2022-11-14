#!/bin/bash

DIR=$(dirname "${BASH_SOURCE[0]}")

if [ $# -ne 1 ]; then
    echo "usage: Enter the number of concurent requests ";
    exit 1;
fi

nclients=$1

for i in `seq 1 ${nclients}`
do
    ${DIR}/curl.sh  &
done
wait




