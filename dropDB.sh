#!/usr/bin/bash
read -p "please enter the name of database you want to remove "  x

    if [[ -d  databases/$x ]];then
            rm -r databases/$x
        elif [[ -f databases/$x ]];then
            echo "Not exist"        
    fi