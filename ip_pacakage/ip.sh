#!/bin/bash
str=""
i=0
send=0
receive=0
while read LINE
do
    str=$LINE
    arr=(${str// / })

    if [ "${arr[0]}" == "No." ]
    then
        i=`expr $i + 1`
    fi

    if [ "${arr[2]}" == "192.168.1.172" ]
    then
        send=$(($send + 1))
    fi

    if [ "${arr[2]}" == "182.254.139.111" ]
    then
        ((receive++))
    fi
done < ip.txt

echo "There r ${i} packages"
echo "${send} send packages"
echo "${receive} receive packages"

