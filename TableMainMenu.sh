#!/bin/bash
echo "Welcome to Table Main Menu :)"
PS3='Please enter your choice: '
options=("Create Table" "List Current Tables" "Drop Table" "Insert into Table" "Select from Table" "Delete from Table" "Update Table" "Exit")
select opt in "${options[@]}"
do
    case $opt in
        "Create Table")
            bash ./createtable.sh

            ;;
        "List Current Tables")
            bash ./listtable.sh

            ;;
        "Drop Table")
            bash ./DropTable.sh

            ;;
        "Insert into Table")
            bash ./insertTable.sh

            ;;
	    "Select from Table")
	        bash ./selectTable.sh

	    ;;
        "Delete from Table")
	        bash ./DeleteTable.sh

	    ;;
	    "Update Table")
            bash ./UpdateTable.sh

	    ;;
        "Exit")
            break

            ;;
        *) echo "invalid option $REPLY";;
    esac
done

