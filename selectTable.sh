#!/usr/bin/bash
read -p "enter table name you want select " tableName

selectcolumn(){
    read -p "please enter column you want to select " columnName
    s=$(sed -n /$columnName/p databases/emplyee)
        if [[ $columnName ]] && [[ $s ]];then

            echo "select $columnName from $tableName"
            awk -v columnName=$columnName '
            BEGIN{FS=":" ; columnName=columnName ; h=0}
            {
            i=1
            while(i<=5){ 
            if ($i==columnName)
            {
            h=i
            }
            i++
            }
            print $h
            }
            ' databases/$tableName
    
    else
        echo "coloumn not found"
        selectcolumn
    fi

}



selecttable(){

    if [ -f databases/$tableName ] ;then
    touch databases/$tableName
    echo " choose do you want select all or column?"
    options=("if All 1" "if column 2")
    select opt in "${options[@]}"
    do
    case $opt in
        "if All 1")
            echo "Select all from $tableName"          
            cat databases/$tableName
            break;
            ;;
        "if column 2")
            selectcolumn
      

            break;
            ;;
        *) echo "invalid option $REPLY please try again" 
           echo "choose do you want select all or column?"
           echo "if All 1 "
           echo "if column 2" ;;
    esac
    done
    else
        echo "table not exist"
        read -p "Enter table name you want to create : " tableName
            while (true)
            do
                if [ -f databases/$tableName ] ;then
                selecttable
                break;
            else
                echo "table not exist"
                read -p "Enter table name you want to create : " tableName
                fi
    done
    fi

}

selecttable