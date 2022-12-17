#!/bin/bash
echo "Updatinging Table...."
PS3='Please enter your choice: '
options=("List Current Tabless" "Update Table" "Table Main Menu"  "Exit")
select opt in "${options[@]}"
do
    case $opt in
        "List Current Tables")
            ls -f | grep/ #path of choosen database    

            ;;
        "Update Table")
            read -p "Enter Table Name : " Tname
            if [ -e $Tname ]; then
                    cd $Tname
		    ls $Tname
		    read -p "Enter File Name: " Fname
		    if [ -e $Fname ]; then
			    gedit $Fname
		    else
			    echo "File Not Found"
                    
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

