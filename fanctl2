




while [[ 1 ]]
do
    if [[ "$(ec_probe read 0x6A | cut -c 1-2)" == 30 ]]
    then
        sleep 3
    elif [[ "$(ec_probe read 0x6A | cut -c 1-2)" == 45 ]]
    then
        sleep 2.5
    elif [[ "$(ec_probe read 0x6A | cut -c 1-2)" == 65 ]]
    then
        sleep 1
    else
        sleep 60
    fi
    ec_probe write 0x60 0x07
done
