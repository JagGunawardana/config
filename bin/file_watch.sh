#!/usr/bin/env bash

if [ $# -ne 2 -a $# -ne 3 ]; then
    echo "Usage $0 dir_to_watch tests_to_run [debug command]"
    exit 1
fi

dirname=$1
lockfile=`tempfile`
debug_command=""

if [ $# -eq 3 ]; then
    debug_command="--$3"
fi

touch $lockfile

while true
do
    new_files=`find $dirname -type f -newer $lockfile -name "*.py"`
    if [ ${#new_files} -gt 0 ]; then
        py.test $debug_command $2 || echo -e "\a"
    fi
    touch $lockfile
    sleep 1
done
