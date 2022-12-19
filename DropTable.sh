#!/bin/bash
echo "Dropping Table...."
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
            if [ -e $Tname ]; then
                    rm -r $Tname
		    echo "Table Dropped Successfully"
            else
                    echo "Table Not Found"
            fi

            ;;
        "Table Main Menu")
            #call the table main menu script

            ;;
        "Exit")
            break

            ;;
        *) echo "invalid option $REPLY";;
    esac
done

