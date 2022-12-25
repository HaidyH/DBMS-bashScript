#!/usr/bin/bash

read -p "please enter the name of database you want to list : " x
if [[ -d  databases/$x ]];then
    ls  databases/$x
else
    echo "please enter a valid databse table"        
fi


