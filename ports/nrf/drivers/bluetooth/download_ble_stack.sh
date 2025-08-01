#!/bin/bash

function download_s110_nrf51_8_0_0
{
    echo ""
    echo "####################################"
    echo "### Downloading s110_nrf51_8.0.0 ###"
    echo "####################################"
    echo ""

    mkdir -p $1/s110_nrf51_8.0.0
    cd $1/s110_nrf51_8.0.0
    wget https://micropython.org/resources/nrf-soft-device/s110nrf51800.zip
    unzip -u s110nrf51800.zip
    rm s110nrf51800.zip
    cd -
}

function download_s132_nrf52_6_1_1
{
    echo ""
    echo "####################################"
    echo "### Downloading s132_nrf52_6.1.1 ###"
    echo "####################################"
    echo ""

    mkdir -p $1/s132_nrf52_6.1.1
    cd $1/s132_nrf52_6.1.1
    wget https://micropython.org/resources/nrf-soft-device/s132nrf52611.zip
    unzip -u s132nrf52611.zip
    rm s132nrf52611.zip
    cd -
}

function download_s140_nrf52_6_1_1
{
    echo ""
    echo "####################################"
    echo "### Downloading s140_nrf52_6.1.1 ###"
    echo "####################################"
    echo ""

    mkdir -p $1/s140_nrf52_6.1.1
    cd $1/s140_nrf52_6.1.1
    wget https://micropython.org/resources/nrf-soft-device/s140nrf52611.zip
    unzip -u s140nrf52611.zip
    rm s140nrf52611.zip
    cd -
}

function download_s140_nrf52_7_3_0
{
    echo ""
    echo "####################################"
    echo "### Downloading s140_nrf52_7.3.0 ###"
    echo "####################################"
    echo ""

    mkdir -p $1/s140_nrf52_7.3.0
    cd $1/s140_nrf52_7.3.0
    wget https://micropython.org/resources/nrf-soft-device/s140_nrf52_7.3.0.zip
    unzip -u s140_nrf52_7.3.0.zip
    rm s140_nrf52_7.3.0.zip
    cd -
}

SCRIPT_DIR="$(cd -P "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ $# -eq 0 ]; then
    echo "No Bluetooth LE stack defined, downloading all."
    download_s110_nrf51_8_0_0 ${SCRIPT_DIR}
    download_s132_nrf52_6_1_1 ${SCRIPT_DIR}
    download_s140_nrf52_6_1_1 ${SCRIPT_DIR}
    download_s140_nrf52_7_3_0 ${SCRIPT_DIR}
else
    case $1 in
        "s110_nrf51" )
            download_s110_nrf51_8_0_0 ${SCRIPT_DIR} ;;
        "s132_nrf52_6_1_1" )
            download_s132_nrf52_6_1_1 ${SCRIPT_DIR} ;;
        "s140_nrf52_6_1_1" )
            download_s140_nrf52_6_1_1 ${SCRIPT_DIR} ;;
        "s140_nrf52_7_3_0" )
            download_s140_nrf52_7_3_0 ${SCRIPT_DIR} ;;
    esac
fi

exit 0
