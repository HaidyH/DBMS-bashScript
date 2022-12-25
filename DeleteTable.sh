#!/bin/bash
echo "Deleting Record from Table...."
read -p "what is database name " mydb
read -p "enter table name you want to delete from : " tableName
PS3='Please enter your choice: '
options=("Delete Record" "Delete all Records" "Exit")
select opt in "${options[@]}"
do
    case $opt in
        "Delete Record")
            read -p "please enter number of column you want to delete " x
            s=$(sed -n /$x/p databases/$mydb/$tableName)
            if [[ $x ]] && [[ $s ]];then
                echo "delete $x from $tableName"
                sed -i $x'd' databases/$mydb/$tableName
            else
                echo "column not found"
            fi
            
            ;;
        "Delete all Records")
            sed -i '1,$d' databases/$mydb/$tableName
            sed -i '1,$d' databases/$mydb/$tableName-metadata

            ;;
        "Exit")
            break

            ;;
        *) echo "invalid option $REPLY";;
    esac
done