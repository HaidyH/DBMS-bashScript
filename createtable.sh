#!/usr/bin/bash

#function to check if primary key or not

pk="false"
datatype="int"

ispk(){
    echo "Is the feild is primary key ?"
    options=("if yes press 1" "if no press 2")
    select opt in "${options[@]}"
    do
    case $opt in
        "if yes press 1")
            echo "yes"
            pk="true"
            break;
            ;;
        "if no press 2")
            echo "no"
            pk="false"
            break;
            ;;
        *) echo "invalid option $REPLY please try again";;
    esac
    done

}

datatypeis(){
    echo " what is the data type of the field ?"
    options=("if int press 1" "if string press 2")
    select opt in "${options[@]}"
    do
    case $opt in
        "if int press 1")
            echo "int"
            datatype="int"
            break;
            ;;
        "if string press 2")
            echo "string"
            datatype="string"
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
        echo $pk
        if [[ $pk -eq "true" ]] ;then

            echo -n "pk = true" > ./$tableName/$columnName
        
        elif [[ $pk -eq "false" ]] ;then
            echo -n "pk = false " > ./$tableName/$columnName
        fi
        datatypeis
        echo $datatype
        if [[ $datatype -eq "int" ]] ;then

            echo -n "datatype = int" > ./$tableName/$columnName

        elif [[ $datatype -eq "string" ]] ;then
            echo -n "datatype = string" > ./$tableName/$columnName
        fi
        i=($i+1)
    done
fi








