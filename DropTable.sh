#!/bin/bash
echo "Dropping Table...."
read -p "what is database name " mydb
PS3='Please enter your choice: '
options=("List Current Tabless" "Drop Table" "Table Main Menu"  "Exit")
select opt in "${options[@]}"
do
    case $opt in
        "List Current Tables")
            ls    

            ;;
        "Drop Table")
            read -p "Enter Table Name : " Tname
            if [ -e databases/$mydb/$Tname ]; then
                    rm databases/$mydb/$Tname
		    echo "Table Dropped Successfully"
            else
                    echo "Table Not Found"
            fi

            ;;
        "Table Main Menu")
            bash ./TableMainMenu.sh

            ;;
        "Exit")
            break

            ;;
        *) echo "invalid option $REPLY";;
    esac
done

