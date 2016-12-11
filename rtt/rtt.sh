#!/bin/bash

#sudo tcpdump host www.zilong3033.cn > log.txt # 抓取到达和离开www.jaylan.cc的数据包

rtts=0
rttd=0
temp=0
rto=0
while read LINE
do
    str=$LINE
    arr=(${str// / }) # 按照空格分割日志内容
    if [ "${arr[0]}" == "[The" ]
    then
        rtt=${arr[7]}
        rtts=`echo "0.875*$rtts + 0.125*$rtt" | bc`
        temp=`echo "$rtts - $rtt" | bc | tr -d -`
        rttd=`echo "0.75*$rttd + 0.25*$temp" | bc`
        rto=`echo "4*$rttd + $rtts" | bc`
        echo "rtt=${rtt}, rto=${rto}"
    fi
done < rtt.txt
