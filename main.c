#include <stdio.h>
#include "probes.h"

int
foo(int a, char *b)
{
	DAEMON_FOO_START(a);
	printf("debug: %d\n", a);
	return (0);
}

int
main(int argc, char *argv [])
{
	for (;;) {
		foo(1, "dfdsfds");
		sleep(2);
	}
	return (0);
}
