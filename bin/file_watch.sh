#!/usr/bin/env bash

if [ $# -ne 2 ]; then
    echo "Usage $0 dir_to_watch command_to_run_on_change"
    exit 1
fi

dirname=$1
lockfile=`tempfile`

touch $lockfile

while true
do
    new_files=`find $dirname -type f -newer $lockfile -name "*.py"`
    if [ ${#new_files} -gt 0 ]; then
        py.test --pdb $2 || echo -e "\a"
    fi
    touch $lockfile
    sleep 1
done
