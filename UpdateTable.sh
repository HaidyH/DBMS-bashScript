#!/bin/bash
echo "Updating Record in Table...."
read -p "what is database name " mydb
read -p "enter table name you want to update : " tableName

selectcolumn(){
    read -p "please enter column you want to update : " columnName
    read -p "please enter the new data : " newdata
    s=$(sed -n /$columnName/p databases/$mydb/$tableName)
        if [[ $columnName ]] && [[ $s ]];then

            echo "select $columnName from $tableName"
            awk -v columnName=$columnName newdata=$newdata '
            BEGIN{FS=":" ; columnName=columnName ; newdata=newdata ; h=0}
            {
            i=1;
            while(i<=NF){
                if($i == $columnName){
                    $i=newdata;
                }
                i++
            }
            ' databases/$mydb/$tableName
    
    else
        echo "coloumn not found"
        selectcolumn
    fi

}