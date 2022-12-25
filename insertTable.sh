#!/usr/bin/bash
#insert 1:haidy:1000$:devops:vois   into   id:name:salary:job:company
read -p "enter table name you want insert into " tableName

insertRow(){
if [ -f databases/$tableName ] ;then

    metadata="$tableName-metadata"
    pk=$(awk 'BEGIN{FS=":"}
    {
    i=1
    while(i<=NF){ 
    if ($i=="pk"){
    print $((i+1))}
    i++
    }
    }
    ' databases/$tableName-metadata)
    echo "please enter you data in order as follows and make sure that primary key is a unique value your primary key is $pk"
    s=$(sed -n /name/p databases/$tableName)
    echo "insert into $s"
    read -p " " newRow
    echo $newRow":" >> ./databases/$tableName
else
    echo "table not exist"
    read -p "Enter table name you want to create : " tableName
    while (true)
     do
     if [ -f databases/$tableName ] ;then
        insertRow
        break;
    else
        echo "table not exist"
        read -p "Enter table name you want to select: " tableName
        fi
    done
fi
}
insertRow
# echo $metadata

# cut -d: -f 2 databases/emplyee