#!/usr/bin/bash
read -p "please enter the name of database table you want to remove "  x

    if [[ -d  $x ]];then
            rm -r $x
        elif [[ -f $x ]];then
            echo "Not exist"        
    fi