#!/bin/bash
> ERTrates.dat
for P in 1.03 1.04 1.05 1.1 1.15 1.2 1.25 1.3 1.35 1.4 1.45 1.5
do
	DATA="fluid_params_phi""$P"".dat"
	gnuplot -persist <<-EOFMarker
		f(x) = a + b*x
		fit f(x) "$DATA" u (\$1)/1000:(\$3 >=0.1 && \$3 <=0.15  ? (log(\$3)) : 1/0) via a,b
		set print "ERTrates.dat" append
		print "$P ", b
	EOFMarker
done
