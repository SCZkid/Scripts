#!/bin/bash

MY_PATH=$1
CUR_PATH=""
while [[ ${#MY_PATH} -gt 0 ]]; do
	if [[ $MY_PATH == */* ]]; then
		CUR_PATH+=${MY_PATH%%/*}"/"
		MY_PATH=${MY_PATH#*/}
	else 
		CUR_PATH+=$MY_PATH
		MY_PATH=""
	fi

	if [[ -h "$CUR_PATH" ]]; then
		echo "${CUR_PATH} is a symlink"
    if ! [[ -e "$CUR_PATH" ]]; then
        echo "${CUR_PATH} does not exist!"
        return
    fi

done
