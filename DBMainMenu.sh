#!/bin/bash
echo "Welcome to DataBase Main Menu :)"
PS3='Please enter your choice: '
options=("Create DataBase" "List Current DataBases" "Connect to DataBase" "Exit")
select opt in "${options[@]}"
do
    case $opt in
        "Create DataBase")
            pwd
			bash ./createDB.sh

            ;;
        "List Current DataBases")
            bash ./listDB.sh

            ;;
        "Connect to DataBase")
			bash ./connectDB.sh
            pwd

            ;;
        "Drop DataBase")
            bash ./dropDB.sh

            ;;
        "Exit")
            break

            ;;
        *) echo "invalid option $REPLY";;
    esac
done