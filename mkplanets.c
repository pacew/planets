#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <time.h>
#include <math.h>

FILE *outf;

double moon_phase, moon_orbit;

#define RTOD(x) ((x) / 2.0 / M_PI * 360)

void
usage (void)
{
	fprintf (stderr, "usage: mkplanets\n");
	exit (1);
}

double
rand01 (void)
{
	return ((double)random () / RAND_MAX);
}

double hand_z;

void
put_hand (double ang)
{
	fprintf (outf, "object {\n");
	fprintf (outf, "\thand\n");
	fprintf (outf, "\trotate <0,0,%g>\n", RTOD (ang));
	fprintf (outf, "\ttranslate <0,0,%g>\n", hand_z);
	fprintf (outf, "}\n");
	hand_z -= .08;
}

int
main (int argc, char **argv)
{
	int c;

	while ((c = getopt (argc, argv, "")) != EOF) {
		switch (c) {
		default:
			usage ();
		}
	}

	if (optind != argc)
		usage ();

	srandom (time (NULL));

	if ((outf = fopen ("TMP.pov", "w")) == NULL) {
		fprintf (stderr, "can't create TMP.pov\n");
		exit (1);
	}

	fprintf (outf, "#include \"planets.pov\"\n");

	hand_z = 0;
	put_hand (rand01 () * 2 * M_PI); // Mercury
	put_hand (rand01 () * 2 * M_PI); // Venus
	put_hand (rand01 () * 2 * M_PI); // Mars
	put_hand (rand01 () * 2 * M_PI); // Jupiter
	put_hand (rand01 () * 2 * M_PI); // Saturn

	moon_phase = rand01 () * 2 * M_PI;
	moon_orbit = rand01 () * 2 * M_PI;

	fprintf (outf, "object {\n");
	fprintf (outf, "\tmoon\n");
	fprintf (outf, "\trotate <%g,0,0>\n", RTOD (moon_phase));
	fprintf (outf, "\ttranslate <1,0,-.5>\n");
	fprintf (outf, "\trotate <0, 0, %g>\n", RTOD (moon_orbit));
	fprintf (outf, "}\n");

	fclose (outf);

	system ("povray +ITMP.pov +Oplanets.png pov.ini > pov.out 2>&1");

	return (0);
}
