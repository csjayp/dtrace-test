TARGETS=probes.h probes.o main

OBJS=	main.o probes.o
CC=	cc

.c.o:
	$(CC) $(CFLAGS) -c $<
	dtrace -G -s probes.d -o probes.o -64 $(OBJS)

probes.o: probes.h main.o
	dtrace -G -s probes.d -o probes.o -64 $(OBJS)

probes.h: probes.d
	dtrace -o probes.h -h -s probes.d

main: $(OBJS)
	$(CC) -o $@ $(OBJS) 

clean:
	rm -fr main *.o probes.h
