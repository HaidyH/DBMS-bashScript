#!/bin/bash
echo "Welcome to DataBase Main Menu :)"
PS3='Please enter your choice: '
options=("Create DataBase" "List Current DataBases" "Connect to DataBase"  "Exit")
select opt in "${options[@]}"
do
    case $opt in
        "Create DataBase")
            pwd
			bash ./createDB.sh

            ;;
        "List Current DataBases")
            #call list database script

            ;;
        "Connect to DataBase")
            pwd
			bash ./connectDB.sh

            ;;
        "Drop DataBase")
            #call drop database script

            ;;
        "Exit")
            break

            ;;
        *) echo "invalid option $REPLY";;
    esac
done