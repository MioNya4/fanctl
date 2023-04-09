#!/bin/sh

echo "this script was never tested and will most prolly not work or damage system. wait 4me 2test and fix it b4 using"
exit 1

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "must be run as root (sudo?)"
    exit 1
fi

mkdir -p /usr/src
cd /usr/src
git clone https://github.com/musikid/acpi_ec
cd acpi_ec
./install.sh

cd /usr/src
git clone https://github.com/pobrn/qc71_laptop
cd qc71_laptop
make dkmsinstall

cd /usr/src
git clone https://github.com/nbfc-linux/nbfc-linux.git
cd nbfc-linux
make PREFIX=/usr confdir=/etc && make PREFIX=/usr confdir=/etc install


dkms autoinstall
depmod -a

modprobe acpi_ec write_support=1
modprobe qc71_laptop

cd /usr/src
git clone https://github.com/MioNya4/fanctl.git
cd fanctl
sh fanctl2.1.sh
