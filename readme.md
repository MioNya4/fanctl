# fanctl

fanctl is a compact behind-suckless driver for controlling both fans of intel nuc x15 (also known as maibenben x568, LAPKC71F, LAPKC71E, LAPKC51E, ADATA XPG Xenia 15, AVELL idk what model but there is, TUXEDO Stellaris 15 gen 3 and others)

# installation

do everything as root (always. its cool, u'll like it ^-^)
First u wanna some way to write to ec memory. You can 

1a) (not tested) compile your kernel with CONFIG_ACPI_EC_DEBUGFS=y, this will generate ec_sys. then u `modprobe ec_sys write_support=1` and that should create some file somewhere in /sys/ but u might try `ec_probe write 0x60 0x10` and if ur fans started working for a few seconds then u succeded

1b) download ur kernel's sources and https://github.com/musikid/acpi_ec, `cd acpi_ec ; ./install.sh ; modprobe acpi_ec`
this will create /dev/ec which my driver works with.

2) (c version is deprecated since u need to reopen file each time u wanna read performance button state, and thats not efficient. bash version (fanctl2.sh) is more efficient atm)

download fanctl2.sh and... run it?

# usage

`sh fanctl2.sh`

control ur fans speed with a "performance" button near the power button, 0 led is mode 1, 1 led is mode 2 and both leds means mode 3 (modes speed description below)

"performance" button has 3 states: 1, 2 and 3. `1` will make fans spinning like 1450-2200 (quiet mode), `2` is like 2200-3100 (still quiet but cooler) and `3` is 3000-5500 (a lil noisy)

fan speed can be observed with `sensors` if https://github.com/pobrn/qc71_laptop module is loaded. with atmosphere pressure maximum i got is 5500rpm.

adjust values of `sleep` command for results that suit u. `3.5`, `2.2` and `1` work perfect 4me. less sleep means faster fans (0 sleep will shutdown your machine immediately idk why xd). 

do not run on devices that are not intel(c) nuc x15, even tho the worst thing can happen is immediate shutdown, so there is no way u damage ur hardware, im still not responsible for anything.

# also

this driver is totally safe to use because ec memory resets on shutdown (i think). 

if you use mode `1` but temperature rises (lets say 85C), it will still increase rpm (lets say to 3000+), and this is intended behaviour that i dont wanna change because full manual control eiter require monitoring temperatures or it is unsafe
