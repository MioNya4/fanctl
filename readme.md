# fanctl

fanctl is a compact behind-suckless driver for controlling both fans of intel nuc x15 (also known as maibenben x568, LAPKC71F, LAPKC71E, LAPKC51E, ADATA XPG Xenia 15, AVELL idk what model but there is, TUXEDO Stellaris 15 gen 3 and others)

# installation

do everything as root (always. its cool, u'll like it ^-^)

1) download ur kernel's sources and https://github.com/musikid/acpi_ec, `cd acpi_ec ; ./install.sh ; modprobe acpi_ec`
this will create /dev/ec which my driver works with.

2) install qc71_laptop from https://github.com/pobrn/qc71_laptop (it has How to install in readme)

3) download fanctl2.1.sh and... run it?

# usage

`sh fanctl2.1.sh`

"performance" button (a lil cute button right next to power button) has 3 states: 1, 2 and 3, in shell code you will see 3 different tg= values (2000, 3000 and 5000). these are rpm values that this driver will try to keep (+-100) (and you can modify them!)

fan speed can be observed with `sensors` if qc71_laptop module is loaded. with atmosphere pressure maximum i got is 5500rpm.

Changing rpm from 0 to 5000 (or from 5000 to 0) can take UP TO 2 MINUTES! Thats not a bug!

# also

if for some reason u cant install qc71_laptop, use fanctl2.0.sh. it doesnt require qc, but it uses sleep values between writing to ec for controlling rpm. 

do not run on devices that are not intel(c) nuc x15, even tho the worst thing can happen is immediate shutdown, so there is no way u damage ur hardware, im still not responsible for anything.

this driver is totally safe to use because ec memory resets on shutdown (i think). 

if you use mode `1` but temperature rises (lets say 85C), it will still increase rpm (lets say to 3000+), and this is intended behaviour that i dont wanna change because full manual control eiter require monitoring temperatures or it is unsafe
