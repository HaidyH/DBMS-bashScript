#!/usr/bin/bash
mydb="haidydatabase"
read -p "Enter table name you want to list : " tableName

if [ -f databases/$mydb/$tableName ] ;then
    cat databases/$mydb/$tableName

else 
       echo "Table with name $tableName Not exists please try again or exit"
       options=("press 1 to try again" "press 2 to exit")
        select opt in "${options[@]}"
            do
            case $opt in
            "press 1 to try again")
            echo "try"
            read -p "Enter table name you want to list : " tableName
            if [ -f databases/$mydb/$tableName ] ;then
                cat databases/$mydb/$tableName
                break
            else 
                echo "Table with name $tableName Not exists please try again or exit"
                echo "press 1 to try again" "press 2 to exit"
            fi

            
            
            ;;
            "press 2 to exit")
            echo "exit"
            
            break;
            ;;
        *) echo "invalid option $REPLY please try again";;
    esac
    done 

fi