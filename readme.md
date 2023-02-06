# UPDATE

1) get ur ec_probe working by instructions below

2) download fanctl2.sh and run it as root

3) done! control ur fans speed with a "performance" button near the power button, 0 led is mode 1, 1 led is mode 2 and both leds means mode 3 (modes speed description below)

# fanctl

fanctl is a compact behind-suckless driver for controlling both fans of intel nuc x15 (also known as LAPKC71F, LAPKC71E, LAPKC51E, ADATA XPG Xenia 15, AVELL idk what model but there is, TUXEDO Stellaris 15 gen 3 and others)

# installation

do everything as root (always. its cool, u'll like it ^-^)
First u wanna some way to write to ec memory. You can 

1a) (not tested) compile your kernel with CONFIG_ACPI_EC_DEBUGFS=y, this will generate ec_sys. then u `modprobe ec_sys write_support=1` and that should create some file somewhere in /sys/ but u might try `ec_probe write 0x60 0x10` and if ur fans started working for a few seconds then u succeded

1b) download ur kernel's sources and https://github.com/musikid/acpi_ec, `cd acpi_ec ; ./install.sh ; modprobe acpi_ec`
this will create /dev/ec which my driver works with.

2a) (not recommended) download fanctl binary and run like `chmod +x fanctl ; fanctl 2`
2b) download fanctl.c, run `gcc fanctl.c` and rename a.out to what makes sense 2u

# usage

`./fanctl 1`

where `1` can be 1, 2 or 3. `1` will make fans spinning like 1450-2200 (quiet mode), `2` is like 2200-3100 (still quiet but cooler) and `3` is 3000-4000 (a lil noisy). notice that `4` will make zero delay for writing to registers and will shutdown your machine immediately. 

do not run without arguments (mostly sigsegv)

# also

this driver is totally safe to use because ec memory resets on shutdown (i think). 

if you use mode `1` but temperature rises (lets say 85C), it will still increase rpm (lets say to 3000+), and this is intended behaviour that i dont wanna change because full manual control eiter require monitoring temperatures or it is unsafe
