#!/bin/bash
echo "Welcome to Table Main Menu :)"
PS3='Please enter your choice: '
options=("Create Table" "List Current Tables" "Drop Table" "Insert into Table" "Select from Table" "Delete from Table" "Update Table" "Exit")
select opt in "${options[@]}"
do
    case $opt in
        "Create Table")
            #call create table script

            ;;
        "List Current Tables")
            #call list tables script

            ;;
        "Drop Table")
            #call drop table script

            ;;
        "Insert into Table")
            #call insert into table script

            ;;
	"Select from Table")
	    #call select from table script

	    ;;
        "Delete from Table")
	    #call delete from table script

	    ;;
	"Update Table")
            #call update table script

	    ;;
        "Exit")
            break

            ;;
        *) echo "invalid option $REPLY";;
    esac
done

