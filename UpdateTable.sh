#!/bin/bash
echo "Updating Record in Table...."
read -p "enter table name you want to update in it : " tableName
read -p "please enter number of column you want to update : " x
s=$(sed -n /$x/p databases/$tableName)
if [[ $x ]] && [[ $s ]];then
    read -p "please enter the new value : " x
    
    
else
    echo "column not found"
