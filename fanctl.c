#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main() {
char a;
int x;
FILE * ec_sys = fopen("/dev/ec", "r+");

while (1)
  { ec_sys = fopen("/dev/ec", "r+");
	fseek(ec_sys, 0x6A, SEEK_SET);
	fread(&a, sizeof (char), 1, ec_sys);
	fseek(ec_sys, 0x60, SEEK_SET);
	fwrite(&a, sizeof (char), 1, ec_sys);
	fflush(stdout);
	if (a = 30) {sleep(3);};
	if (a = 45) {sleep(2);};
	if (a = 65) {sleep(1);}
	else {sleep(10);};s
	fclose(ec_sys); }
fclose(ec_sys);
}
