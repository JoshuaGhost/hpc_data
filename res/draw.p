set term png
unset log
unset label
set xtic auto
set ytic auto
set datafile separator ","
set key right top

set title "Power consumed by Odroid-XU3 device on running cg class A"
set xlabel "Timestamp (s)"
set ylabel "Power (Watt)"
set output "cg.A.power.png"
plot "cg.A.1.power.txt" u 0:3 title "1 kernel" with line,"cg.A.2.power.txt" u 0:3 t "2 kernels" with line, "cg.A.4.power.txt" u 0:3 t "4 kernels" with line, "cg.A.8.power.txt" u 0:3 t "8 kernels" with line;

set title "Power consumed by Odroid-XU3 device on running cg class B"
set output "cg.B.power.png"
plot "cg.B.1.power.txt" u 0:3 title "1 kernel" with line,"cg.B.2.power.txt" u 0:3 t "2 kernels" with line, "cg.B.4.power.txt" u 0:3 t "4 kernels" with line, "cg.B.8.power.txt" u 0:3 t "8 kernels" with line;

set title "Power consumed by Odroid-XU3 device on running lu class B"
set output "lu.B.power.png"
plot "lu.B.1.power.txt" u 0:3 title "1 kernel" with line,"lu.B.2.power.txt" u 0:3 t "2 kernels" with line, "lu.B.4.power.txt" u 0:3 t "4 kernels" with line, "lu.B.8.power.txt" u 0:3 t "8 kernels" with line;

set title "Power consumed by Odroid-XU3 device on running lu class A"
set output "lu.A.power.png"
plot "lu.A.1.power.txt" u 0:3 title "1 kernel" with line,"lu.A.2.power.txt" u 0:3 t "2 kernels" with line, "lu.A.4.power.txt" u 0:3 t "4 kernels" with line, "lu.A.8.power.txt" u 0:3 t "8 kernels" with line;

set title "Power of critical units on running lu class B with 4 kernels"
set xlabel "Timestamp (s)"
set ylabel "Power (Watt)"
set output "lu.B.sensor.png"; 
plot "lu.B.4.sensor.txt" u 0:4 title "A7_Watt" with line,"lu.B.4.sensor.txt" u 0:7 t "A15_Watt" with line, "lu.B.4.sensor.txt" u 0:10 t "GPU_Watt" with line, "lu.B.8.sensor.txt" u 0:13 t "Mem_Watt" with line
     
set key right bottom;
set title "Total energy consumption of Odroid-XU3 device on running cg class A"
sum1=0; sum2=0; sum4=0;sum8=0;
set output "cg.A.energy.png"
plot "cg.A.1.power.txt" u 0:(sum1=sum1+$3) t "1 kernel", "cg.A.2.power.txt" u 0:(sum2=sum2+$3) t "2 kernels", "cg.A.4.power.txt" u 0:(sum4=sum4+$3) t "4 kernels", "cg.A.8.power.txt" u 0:(sum8=sum8+$3) t "8 kernels";

set title "Total energy consumption of Odroid-XU3 device on running cg class B"
sum1=0; sum2=0; sum4=0;sum8=0;
set output "cg.B.energy.png"
plot "cg.B.1.power.txt" u 0:(sum1=sum1+$3) t "1 kernel", "cg.B.2.power.txt" u 0:(sum2=sum2+$3) t "2 kernels", "cg.B.4.power.txt" u 0:(sum4=sum4+$3) t "4 kernels", "cg.B.8.power.txt" u 0:(sum8=sum8+$3) t "8 kernels";

set title "Total energy consumption of Odroid-XU3 device on running lu class A"
sum1=0; sum2=0; sum4=0;sum8=0;
set output "lu.A.energy.png"
plot "lu.A.1.power.txt" u 0:(sum1=sum1+$3) t "1 kernel", "lu.A.2.power.txt" u 0:(sum2=sum2+$3) t "2 kernels", "lu.A.4.power.txt" u 0:(sum4=sum4+$3) t "4 kernels", "lu.A.8.power.txt" u 0:(sum8=sum8+$3) t "8 kernels";

set title "Total energy consumption of Odroid-XU3 device on running lu class B"
sum1=0; sum2=0; sum4=0;sum8=0;
set output "lu.B.energy.png"
plot "lu.B.1.power.txt" u 0:(sum1=sum1+$3) t "1 kernel", "lu.B.2.power.txt" u 0:(sum2=sum2+$3) t "2 kernels", "lu.B.4.power.txt" u 0:(sum4=sum4+$3) t "4 kernels", "lu.B.8.power.txt" u 0:(sum8=sum8+$3) t "8 kernels";

set title "Processing units temperature monitoring on running lu class B with 4 kernels"
set xlabel "Timestamp (s)"
set ylabel "Temperature (Celsius Degree)"
set output "lu.B.temp.png"
plot "lu.B.4.sensor.txt" u 0:23 title "CPU4_Temp" with line,"lu.B.4.sensor.txt" u 0:24 t "CPU5_Temp" with line, "lu.B.4.sensor.txt" u 0:25 t "CPU6_Temp" with line, "lu.B.4.sensor.txt" u 0:26 t "CPU7_Temp" with line, "lu.B.4.sensor.txt" u 0:26 t "GPU_Temp" with line;

                                                    
