#!/bin/bash
echo "Creating DataBase...."
export LC_COLLATE=C
shopt -s extglob

namingRegex(){
    while (true)
    do
        if [[ $DBname =~ ^[a-zA-Z]+[a-zA-Z0-9]*$ ]] ; then
            break;
        else
            echo -e "\n Please Enter A Vaild Name (only letters preferred) " 
            read -p "Enter DataBase name you want to create : " DBname
        fi
    done
}

PS3='Please enter your choice: '
options=("List Current DataBases" "Create New DataBase" "Main Menu"  "Exit")
select opt in "${options[@]}"
do
    case $opt in
        "List Current DataBases")
            ls ./databases    #in this folder we will save the new databases

            ;;
        "Create New DataBase")
            read -p "Enter New DataBase Name : " DBname
            namingRegex
	    if [ -e $DBname ]; then
		    echo "DataBase already Exists"
	    else
		    mkdir ./databases/$DBname
		    cd ./databases/$DBname
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
