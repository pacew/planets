all: planets.png

planets.png: planets.pov pov.ini Makefile
	povray +Iplanets.pov +Oplanets.png pov.ini > pov.out 2>&1
	@cat fatal.out warning.out
	@test ! -s fatal.out -a ! -s warning.out

