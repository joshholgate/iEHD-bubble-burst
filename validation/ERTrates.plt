set terminal postscript eps enhanced colour font ",20"
set output "ERTrates.eps"
set xrange [0.975:1.5]
set size square
set xlabel "{/Symbol e}_0E_0^2 / k{/Symbol g}"
set ylabel "Normalised growth rate, i{/Symbol w} / ({/Symbol g}k^3{/Symbol r}^{-1})^{1/2}"
#set key top left
set key bottom right
set key spacing 1.2
set yrange [0:0.6]

set isosamples 100000

f(x) = a*sqrt(x-b)
fit f(x) 'ERTrates.dat' u 1:2 via a,b

plot 'ERTrates.dat' u 1:($2/23.7185) w p pt 7 lc 'black' t 'Simulations',\
     '+' using 1:(f($1)/23.7185) w l dt 1 lw 2 lc rgb "black" t 'Fit to sims.',\
     sqrt(x-1) w l dt 2 lw 2 lc rgb "black" t 'Inviscid PT'

