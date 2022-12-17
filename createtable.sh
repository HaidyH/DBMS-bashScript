#!/usr/bin/bash
read -p "Enter table name you want to create : " tableName

pk=false

if [ -d $tableName ] ;then
    echo "Table with name $tableName already exists" 
else 
    mkdir $tableName
    read -p "Enter number of coloumns : " columnsNum
    i=1
    while (( i < $columnsNum+1 ))
    do
        read -p "Enter column $i name : " columnName;
        touch ./$tableName/$columnName
        i=($i+1)
    done
fi
