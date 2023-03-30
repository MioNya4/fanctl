#!/bin/sh




while [[ 1 ]]
do
    LVL="$(ec_probe read 0x6A | cut -c 1-2)"
    if [[ $LWL == 30 or $LWL == 5 ]]
    then
        tg=2000
    elif [[ $LWL == 45 or $LWL == 10 ]]
    then
        tg=3000
    elif [[ $LWL == 65 or $LWL == 15 ]]
    then
        tg=5000
    else
        echo "button state not recognized, do you have ec_sys installed? are you root? do u have LAPKC*1* machine?"
        exit 1
    fi
    
    rtg="$(sensors | grep fan2: | cut -c 14-17)"
    echo $rtg
    if [[ $rtg == "" ]]
    then
        echo "do u have qc71 driver installed? its required to control fan speed, use version 2.0 if u can't install"
    fi
    
    if [[ $rtg > $tg ]]
    then
        sleep 5
    elif [[ $rtg < $tg ]]
    then
        for i in {1..5}
        do
            ec_probe write 0x60 0x10
            sleep 0.7
        done
    fi
    sleep 1
done
 
