CFLAGS = -g -Wall

all: planets-test.png mkplanets 

mkplanets: mkplanets.o
	$(CC) $(CFLAGS) -o mkplanets mkplanets.o -lm

planets-test.png: planets.pov planets-test.pov pov.ini Makefile
	povray +Iplanets-test.pov +Oplanets-test.png pov.ini > pov.out 2>&1
	@cat fatal.out warning.out
	@test ! -s fatal.out -a ! -s warning.out

planets.png: mkplanets planets.pov pov.ini
	./mkplanets

clean:
	rm -f *~ *.out pov.err planets.png mkplanets



