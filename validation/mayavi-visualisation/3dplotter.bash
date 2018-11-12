#!/bin/bash

for i in 0 100 200 300 350 400 410 420 430 440 450 470 #`seq 0 10`
do
	python dropshape5.py $i
	python 3d_drop-zr.py $i
done
