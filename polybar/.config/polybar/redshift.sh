#!/usr/bin/sh

FILE=/tmp/redshift.active

if [ -e $FILE ]
then	
    rm $FILE
    redshift -x
    echo -e '\uf185'
else
    # activate redshift 
    touch $FILE
    redshift -O 4600
    echo -e '\uf186'

fi    

