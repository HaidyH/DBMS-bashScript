#!/usr/bin/bash

#function to check if primary key or not

pk=false

ispk(){
    echo "Is the feild is primary key ?"
    options=("if yes press 1" "if no press 2")
    select opt in "${options[@]}"
    do
    case $opt in
        "if yes press 1")
            echo "yes"
            pk=true
            return 
            break;
            ;;
        "if no press 2")
            echo "no"
            break;
            ;;
        *) echo "invalid option $REPLY please try again";;
    esac
    done

}


read -p "Enter table name you want to create : " tableName



if [ -d $tableName ] ;then
    echo "Table with name $tableName already exists" 
else 
    mkdir $tableName

    while true
    do
    read -p "Enter number of coloumns : " columnsNum
    if [[ $columnsNum ]] && [[ "$columnsNum" =~ ^[0-9]+$ ]];then
        break
    fi
    done
    declare -i i=1
    while (( i < $columnsNum+1 ))
    do
        read -p "Enter column $i name : " columnName; 
        touch ./$tableName/$columnName
        ispk
        i=($i+1)
    done
fi








