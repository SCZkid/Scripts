#!/bin/bash

MY_PATH=$1

if [[ ${#MY_PATH} -eq 0 ]]; then
        echo "No path given!"
        exit
fi

CUR_PATH=""
while [[ ${#MY_PATH} -gt 0 ]]; do
        if [[ $MY_PATH == */* ]]; then
                CUR_PATH+=${MY_PATH%%/*}
                MY_PATH=${MY_PATH#*/}
        else
                CUR_PATH+=$MY_PATH
                MY_PATH=""
        fi

        if [[ -h "$CUR_PATH" ]]; then
                echo "${CUR_PATH} is a symlink"
        fi

        if ! [[ -f "$CUR_PATH" ]]; then
                CUR_PATH+="/"
        fi

        if ! [[ -e "$CUR_PATH" ]]; then
                echo "${CUR_PATH} does not exist!"
                exit
        fi

done
echo "${CUR_PATH} appears to exist"