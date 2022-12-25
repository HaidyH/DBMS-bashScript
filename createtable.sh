#!/usr/bin/bash

#function to check if primary key or not

datatypeis(){
    echo " what is the data type of the field ?"
    options=("if int press 1" "if string press 2")
    select opt in "${options[@]}"
    do
    case $opt in
        "if int press 1")
            echo "int"
            datatype="int"           
            echo -n $datatype":" >> ./databases/$tableName-metadata
            break;
            ;;
        "if string press 2")
            echo "string"
            datatype="string"
            echo -n $datatype":" >> ./databases/$tableName-metadata
            break;
            ;;
        *) echo "invalid option $REPLY please try again";;
    esac
    done

}


read -p "Enter table name you want to create : " tableName

#function to test table name regex
namingRegex(){
    while (true)
    do
        if [[ $tableName =~ ^[a-zA-Z]+[a-zA-Z0-9]*$ ]] ; then
            break;
        else
            echo -e "\n Please Enter A Vaild Name (only letters preferred) " 
            read -p "Enter table name you want to create : " tableName
        fi
    done
}

namingRegex

pkname(){
    read -p "enter name of primary key column ?" pk
    echo "pk:$pk" >> ./databases/$tableName-metadata
    datatypeis
    echo -n $pk":" >> ./databases/$tableName
}

if [ -f databases/$tableName ] ;then
    echo "Table with name $tableName already exists" 
else 
    touch databases/$tableName
    touch databases/$tableName-metadata


#check num of column is exist and integer
    while true
    do
    read -p "Enter number of coloumns : " columnsNum
    if [[ $columnsNum ]] && [[ "$columnsNum" =~ ^[0-9]+$ ]];then
        break
    fi
    done

    pkname
    declare -i i=2
    while (( i < $columnsNum+1 ))
    do
        read -p "Enter column $i name : " columnName; 
        datatypeis
        echo -n $columnName":" >> ./databases/$tableName
        i=($i+1)
    done
    # awk -v columnsNum=$columnsNum '
    # BEGIN {FS=":" , NF=columnsNum}


    
    # END {} ' /$tableName
fi





        # awk -v columnName="$columnName" -v tableName="$tableName" -v columnsNum=$columnsNum '
        # BEGIN{FS=":"} #start Loop # Seprator
        # {
        # i=1
        # while (i<=columnsNum){
        # $i="column"
        # i++;
        # }
        # } #Body Loop
        # END{print "columnName:" >> /databases/tableName} #End Loop ' ./databases/$tableName