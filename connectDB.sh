#!/bin/bash
echo "Connecting to DataBase...."
PS3='Please enter your choice: '
options=("List Current DataBases" "Connect to DataBase" "Main Menu"  "Exit")
select opt in "${options[@]}"
do
    case $opt in
        "List Current DataBases")
            ls ./databases    #in this folder we will save the new databases

            ;;
        "Connect to DataBase")
            read -p "Enter DataBase Name : " DBname
            if [ -e databases/$DBname ]; then
                    # cd ./databases/$DBname
                    # pwd
                    echo "connected sucessfully"
                    source TableMainMenu.sh
            else
                    echo "Error DataBase Not Found"
            fi

            ;;
        "Main Menu")
            bash ./DBMainMenu.sh

            ;;
        "Exit")
            break

            ;;
        *) echo "invalid option $REPLY";;
    esac
done

