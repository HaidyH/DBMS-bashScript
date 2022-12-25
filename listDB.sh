#!/usr/bin/bash

listspeceficDB(){
    read -p "please enter the name of database you want to list : " x

    if [[ -d  databases/$x ]];then
        ls  databases/$x
    else
        echo "please enter a valid databse table"        
    fi
}


    options=("list all databases" "list specefic database")
    select opt in "${options[@]}"
    do
    case $opt in
        "list all databases")
            ls databases
            bash ./DBMainMenu.sh
            
            ;;
        "list specefic database")
            listspeceficDB
            bash ./DBMainMenu.sh
            
            ;;
        *) echo "invalid option $REPLY please try again" 
           echo "list all databases"
           echo "list specefic database" ;;
    esac
    done





