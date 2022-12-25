#!/bin/bash
echo "Deleting Record from Table...."
read -p "enter table name you want to delete from : " tableName
PS3='Please enter your choice: '
options=("Delete Record" "Delete all Records" "Exit")
select opt in "${options[@]}"
do
    case $opt in
        "Delete Record")
            read -p "please enter number of column you want to delete " x
            s=$(sed -n /$x/p databases/$tableName)
            if [[ $x ]] && [[ $s ]];then
                echo "delete $x from $tableName"
                sed '$xd' $tableName
            else
                echo "column not found"
            fi
            
            ;;
        "Delete all Records")
            sed '1,$d' $tableName

            ;;
        "Exit")
            break

            ;;
        *) echo "invalid option $REPLY";;
    esac
done