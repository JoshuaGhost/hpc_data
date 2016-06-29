set term png
unset log
unset label
set xtic auto
set ytic auto
set datafile separator ","
set key right top

set title "Power consumption of Odroid-XU3 device by task lu of class B (MPI)"
set xlabel "Timestamp (s)"
set ylabel "Power (Watt)"
set output "cores_power.png"
plot\
 	"MPI/lu.B.1.power.txt" u 0:3 t "1 core" with line,\
	"MPI/lu.B.2.power.txt" u 0:3 t "2 cores" with line,\
	"MPI/lu.B.4.power.txt" u 0:3 t "4 cores" with line,\
	"MPI/lu.B.8.power.txt" u 0:3 t "8 cores" with line;


set title "Power consumption of critical units by task lu of class B with 4 cores (MPI)"
set output "units_power.png"; 
plot\
	"MPI/lu.B.4.sensor.txt" u 0:4 t "A7_Watt" with line,\
	"MPI/lu.B.4.sensor.txt" u 0:7 t "A15_Watt" with line,\
	"MPI/lu.B.4.sensor.txt" u 0:10 t "GPU_Watt" with line,\
	"MPI/lu.B.8.sensor.txt" u 0:13 t "Mem_Watt" with line


set title "Power consumption of Odroid-XU3 device by different tasks (MPI)"
set output "tasks_power.png"
plot\
	"MPI/lu.B.2.power.txt" u 0:3 t "lu_2_cores" with line,\
	"MPI/lu.B.4.power.txt" u 0:3 t "lu_4_cores" with line,\
	"MPI/cg.B.2.power.txt" u 0:3 t "cg_2_cores" with line,\
	"MPI/cg.B.4.power.txt" u 0:3 t "cg_4_cores" with line


set title "Power consumption of Odroid-XU3 device by task lu of different scales (MPI)"
set output "scales_power.png"
plot\
	"MPI/lu.B.2.power.txt" u 0:3 t "B_2_cores" with line,\
	"MPI/lu.B.4.power.txt" u 0:3 t "B_4_cores" with line,\
	"MPI/lu.A.2.power.txt" u 0:3 t "A_2_cores" with line,\
	"MPI/lu.A.4.power.txt" u 0:3 t "A_4_cores" with line;
	

set title "Power consumption of Odroid-XU3 device by task lu of class B with different implementations"
set output "implementations_power.png"
plot\
	"MPI/lu.B.2.power.txt" u 0:3 t "MPI_2_cores" with line,\
	"MPI/lu.B.4.power.txt" u 0:3 t "MPI_4_cores" with line,\
	"OMP/lu.B.2.power.txt" u 0:3 t "OpenMP_2_cores" with line,\
	"OMP/lu.B.4.power.txt" u 0:3 t "OpenMP_4_cores" with line;



set key right bottom
set xlabel "Timestamp (s)"
set ylabel "Energy (W*s)"
set title "Energy consumption of Odroid-XU3 device by task of class B (MPI)"
sum1=0; sum2=0; sum4=0;sum8=0;
set output "cores_energy.png"
plot\
	"MPI/lu.B.1.power.txt" u 0:(sum1=sum1+$3) t "1 core",\
	"MPI/lu.B.2.power.txt" u 0:(sum2=sum2+$3) t "2 cores",\
	"MPI/lu.B.4.power.txt" u 0:(sum4=sum4+$3) t "4 cores",\
	"MPI/lu.B.8.power.txt" u 0:(sum8=sum8+$3) t "8 cores";


set title "Energy consumption of Odroid-XU3 device by different tasks (MPI)"
sum1=0; sum2=0; sum4=0;sum8=0;
set output "tasks_energy.png"
plot\
	"MPI/lu.B.2.power.txt" u 0:(sum1=sum1+$3) t "lu_2_cores",\
	"MPI/lu.B.4.power.txt" u 0:(sum2=sum2+$3) t "lu_4_cores",\
	"MPI/cg.B.2.power.txt" u 0:(sum4=sum4+$3) t "cg_2_cores",\
	"MPI/cg.B.4.power.txt" u 0:(sum8=sum8+$3) t "cg_4_cores";


set title "Energy consumption of Odroid-XU3 device by task lu of different scales (MPI)"
sum1=0; sum2=0; sum4=0;sum8=0;
set output "scales_energy.png"
plot\
	"MPI/lu.B.2.power.txt" u 0:(sum4=sum4+$3) t "B_2_cores",\
	"MPI/lu.B.4.power.txt" u 0:(sum8=sum8+$3) t "B_4_cores",\
	"MPI/lu.A.2.power.txt" u 0:(sum1=sum1+$3) t "A_2_cores",\
	"MPI/lu.A.4.power.txt" u 0:(sum2=sum2+$3) t "A_4_cores";
	

set title "Energy consumption of Odroid-XU3 device by task lu of class B with different implementations"
sum1=0; sum2=0; sum4=0;sum8=0;
set output "implementations_energy.png"
plot\
	"MPI/lu.B.2.power.txt" u 0:(sum4=sum4+$3) t "MPI_2_cores",\
	"MPI/lu.B.4.power.txt" u 0:(sum8=sum8+$3) t "MPI_4_cores",\
	"OMP/lu.B.2.power.txt" u 0:(sum1=sum1+$3) t "OpenMP_2_cores",\
	"OMP/lu.B.4.power.txt" u 0:(sum2=sum2+$3) t "OpenMP_4_cores";


set title "Processing units' temperature monitoring on running lu class B with 4 cores (MPI)"
set xlabel "Timestamp (s)"
set ylabel "Temperature (Celsius Degree)"
set output "mpi_temp.png"
plot\
	"MPI/lu.B.4.sensor.txt" u 0:23 t "CPU4_Temp" with line,\
	"MPI/lu.B.4.sensor.txt" u 0:24 t "CPU5_Temp" with line,\
	"MPI/lu.B.4.sensor.txt" u 0:25 t "CPU6_Temp" with line,\
	"MPI/lu.B.4.sensor.txt" u 0:26 t "CPU7_Temp" with line,\
	"MPI/lu.B.4.sensor.txt" u 0:26 t "GPU_Temp" with line;


set title "Processing units' temperature monitoring on running lu class B with 4 cores (OpenMP)"
set output "openmp_temp.png"
plot\
	"OMP/lu.B.4.sensor.txt" u 0:23 t "CPU4_Temp" with line,\
	"OMP/lu.B.4.sensor.txt" u 0:24 t "CPU5_Temp" with line,\
	"OMP/lu.B.4.sensor.txt" u 0:25 t "CPU6_Temp" with line,\
	"OMP/lu.B.4.sensor.txt" u 0:26 t "CPU7_Temp" with line,\
	"OMP/lu.B.4.sensor.txt" u 0:26 t "GPU_Temp" with line;
