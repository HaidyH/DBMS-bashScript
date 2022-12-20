    checkPkInsert
{
        read -p "enter ($fieldName) of type ($fieldType) : " value
        ############################
        ## check empty
        if [ "$value" ]
        then
            echo "nothin">> /dev/null
            #nothing
        else 
            printWarning "please enter a valid value"
            checkPkInsert
        fi
        
        ###########################
        ## check data type
        if [ $fieldType == "int" ]
            then
            checkInt "$value"
            if [ $? != 0 ]
            then
            printWarning "please enter a valid value"
            checkPkInsert
            fi
        fi

        ############################
        ## check PK constraint
        checkPK $i "$value"
        if [ $? != 0 ]
        then
            printFailure "Violation of PK constraint"
            printWarning "please enter a valid value"
            checkPkInsert
        fi
}

function checkNormalInsert
{
        read -p "enter ($fieldName) of type ($fieldType) : " value
        ############################
        ## check empty
        if [ "$value" ]
        then
            echo "nothin">> /dev/null
            #nothing
        else 
            printWarning "please enter a valid value"
            checkNormalInsert
        fi
        
        ###########################
        ## check data type
        if [ $fieldType == "int" ]
            then
            checkInt "$value"
            if [ $? != 0 ]
            then
            printWarning "please enter a valid value"
            checkNormalInsert
            fi
        fi
}





printSuccessful "\nConnected to \"$dbname\""
printWithBoarder "   Insert Record   "
printWithBoarder "avilable tables: " "ls -1 ./databases/$dbname"

read -p "please enter table name : " tableName

if [ $tableName ]
then
    if [ -a ./databases/$dbname/$tableName ]
        then
        coloumnsNomber=`awk -F: 'NR==1 {print NF}' ./databases/$dbname/$tableName`

        for (( i=1; i <= $coloumnsNomber; i++ ))
        do
            ##############################
            ## inserting primary key field
            if testPK=`grep "%:" ./databases/$dbname/$tableName | cut -d ":" -f$i | grep "%PK%" ` 
                then 
                fieldName=`grep "%:" ./databases/$dbname/$tableName | cut -d ":" -f$i | cut -d "%" -f3 `
                fieldType=`grep "%:" ./databases/$dbname/$tableName | cut -d ":" -f$i | cut -d "%" -f4 `
                printInfo "this is primary key it must be uniqe"
                
                checkPkInsert
                insertField "$value"


            #########################    
            ## inserting normal field
            else
                fieldName=`grep "%:" ./databases/$dbname/$tableName | cut -d ":" -f$i | cut -d "%" -f1 `
                fieldType=`grep "%:" ./databases/$dbname/$tableName | cut -d ":" -f$i | cut -d "%" -f2 `
                
                checkNormalInsert
                insertField "$value"
            fi
        done
    else
        printFailure "Table \"$tableName\" doesn't exist"
    fi
else
    printFailure "Invalid input please enter a valid name"
fi

routeFromTable insertRecord.sh "Insert record .."