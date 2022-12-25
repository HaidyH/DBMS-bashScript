#!/bin/bash
echo "Creating DataBase...."
export LC_COLLATE=C
shopt -s extglob
PS3='Please enter your choice: '
options=("List Current DataBases" "Create New DataBase" "Main Menu"  "Exit")
select opt in "${options[@]}"
do
    case $opt in
        "List Current DataBases")
            ls ./ITIDataBases    #in this folder we will save the new databases

            ;;
        "Create New DataBase")
            read -p "Enter New DataBase Name : " DBname
	    if [ -e $DBname ]; then
		    echo "DataBase already Exists"
	    else
		    mkdir ./ITIDataBases/$DBname
		    cd ./ITIDataBases/$DBname
		    echo "DataBase Successfully Created"
		    pwd
		    bash ./TableMainMenu.sh
	    fi

	    ;;
        "Main Menu")
            bash ./DBMainMenu

            ;;
        "Exit")
            break

            ;;
        *) echo "invalid option $REPLY";;
    esac
done
