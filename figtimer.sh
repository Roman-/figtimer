#!/bin/bash
clear
echo "figTimer" | figlet

while [ 1 ]
do
    key="k"
    while [ "$key" != "" ]
    do
        printf "\nHit space to start the timer..."
        read -n1 -r -p "" key
        if [ "$key" = '' ]; then
            ts=$(date +%s%N)
        else
            if [ "$key" = 'q' ]; then echo "uit" ; exit 0 ; fi
        fi
    done

    clear && echo "running" | figlet -W

    read -n1 -r -p "" key

    tt=$((($(date +%s%N) - $ts)/10000000))
    t_ms=`expr $tt % 100`
    tt=`expr $tt / 100`
    t_s=`expr $tt % 60`
    tt=`expr $tt / 60`

    clear
    # output times
    if [ $tt -eq 0 ] ; then
        currenttime=$(printf "%02d.%02d\n" $t_s $t_ms)
    else
        currenttime=$(printf "%02d:%02d.%02d\n" $tt $t_s $t_ms)
    fi

    if [ "$alltimes" == "" ] ; then
        delimeter=""
    else
        delimeter=", "
    fi

    alltimes=$alltimes$delimeter$currenttime

    printf "[$alltimes] \n" && printf $currenttime | figlet -W
done
