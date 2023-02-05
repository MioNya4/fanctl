#include <stdio.h>
#include <unistd.h>

int main(int argc, char **argv) {
char a = '\x10';
int x = 3 - (argv[1][0] - 49);
printf("%d", x);
FILE * ec_sys = fopen("/dev/ec", "r+");
while (1)
	{ fseek(ec_sys, 0x60, SEEK_SET);
	  fwrite(&a, sizeof (char), 1, ec_sys);
	  sleep(x); }
fclose(ec_sys);
}
