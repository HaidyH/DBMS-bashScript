#!/bin/bash
echo "Connecting to DataBase...."
PS3='Please enter your choice: '
options=("List Current DataBases" "Connect to DataBase" "Main Menu"  "Exit")
select opt in "${options[@]}"
do
    case $opt in
        "List Current DataBases")
            ls -f | grep/ ./ITIDataBases    #in this folder we will save the new databases

            ;;
        "Connect to DataBase")
            read -p "Enter DataBase Name : " DBname
            if [ -d $DBname ]; then
                    cd ./ITIDataBases/$DBname
		    #then we should call tables main menu script
            else
                    echo "Error DataBase Not Found"
            fi

            ;;
        "Main Menu")
            #call the main menu script

            ;;
        "Exit")
            break

            ;;
        *) echo "invalid option $REPLY";;
    esac
done

