#!/bin/bash

resultdir="~/res/"
if [ -f $resultdir ];
then
	mkdir -r $resultdir
fi

basedir="/home/user5/LAB/NAS/"
verdir="NPB3.3.1/"
vershort="NPB3.3"

impls="MPI OMP"
benchmark_names="CG LU"
class_names="S W A B C D"

core_nums="1 2 4 8"

for impl in $impls;
do
    cp $base_dir$impl"/make.def" $base_dir$ver_dir$ver_short"-"$impl"/config/"
    for bn in $benchmark_names;
    do
	    for cn in $class_names;
		do
			for core_num in ${core_nums[@]};
			do
				echo $core_num
				PWD=`pwd`
				cd $basedir$verdir$vershort"-"$impl"/"
				make_command="make $bn"
				if [ $impl == "MPI" ];
				then
					make_command+=" NPROCS=$core_num"
				elif [ $core_num -gt 1 ];
				then
					break
				fi
				make_command+=" CLASS=$cn"
				($make_command)
			done
		done
	done
done
