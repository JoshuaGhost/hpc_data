#!/bin/bash

res_dir="/home/user5/res/"
if [ ! -f $resultdir ];
then
	mkdir -p $resultdir
fi

basedir="/home/user5/LAB/NAS/"
verdir="NPB3.3.1/"
vershort="NPB3.3"

impls="MPI OMP"
benchmark_names="cg lu"
class_names="A B"

core_nums="1 2 4 8"

mes_sensor="stdbuf -oL read-xu3-sensors -c -t"
mes_power="stdbuf -oL smartpower -c -t"

for impl in $impls;
do
    for bn in $benchmark_names;
    do
	    for cn in $class_names;
		do
			for core_num in $core_nums;
			do
				res_folder=$res_dir"/"$impl"/"
				if [ ! -f $res_folder ];
				then
					mkdir -p $res_folder
				fi
				sensor_res_filename=$res_folder$bn"."$cn"."$core_num".sensor.txt"
				power_res_filename=$res_folder$bn"."$cn"."$core_num".power.txt"
				if [ -e $sensor_res_filename ] && 
				   [ `wc -l $sensor_res_filename|cut -f 1 --delimiter=" "` != "0" ] && 
				   [ -e $power_res_filename ] &&
				   [ `wc -l $power_res_filename|cut -f 1 --delimiter=" "` != "0" ];
				then
					continue
				fi
				($mes_sensor)>$sensor_res_filename& 
				pid_mes_sensor=$!
				($mes_power)>$power_res_filename&
				pid_mes_power=$!
				echo $sensor_res_filename
				echo $power_res_filename
				sleep 10 
				cd "/home/user5/LAB/NAS/NPB3.3.1/NPB3.3-"$impl"/bin"
				if [ $impl == "MPI" ];
				then
					run_cmd="mpirun.mpich -np $core_num ./"$bn"."$cn"."$core_num
					echo $run_cmd
				else
					export OMP_NUM_THREADS=$core_num
					run_cmd="./"$bn"."$cn".x"
				fi
				($run_cmd)
				sleep 10
				echo $pid_mes_sensor $pid_mes_power
				kill $pid_mes_sensor
				kill $pid_mes_power
				sync
				sleep 2
			done
		done
	done
done
