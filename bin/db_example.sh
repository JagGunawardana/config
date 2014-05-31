#!/bin/bash

# Login to a db
# $1 env integration, testing, staging
# $2 type storeo

if [ $# -ne 2 ]; then
    echo "Parameter error - provided $# parameters."
    echo "Usage $0 (integration|testing|staging) (storefront|backstage|locker)"
    exit 1
fi
case $1 in
int*)
    echo "Using integration database"
    case $2 in
        storefront)
            mysql 
            ;;
        backstage)
            mysql 
            ;;
        locker)
            ;;
        esac
    ;;
test*)
    echo "Using testing database"
    case $2 in
        storefront)
            mysql 
            ;;
        backstage)
            mysql 
            ;;
        locker)
            mysql 
            ;;
        esac
    ;;
stag*)
    echo "Using staging database"
    case $2 in
        storefront)
            mysql 
            ;;
        backstage)
            mysql 
            ;;
        locker)
            mysql 
            ;;
        esac
    ;;
*)
    echo "Failed to match $1:"
    echo "Usage $0 (integration|testing|staging) (storefront|backstage|locker)"
    exit 1
    ;;
esac






