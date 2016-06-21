import os

result_dir = "~/res"
base_dir = "~/LAB/NAS/"
ver_dir= "NPB3.3.1/"
ver_short = "NPB3.3"
impls= ["MPI", "OMP"]

benchmark_names = ["CG", "LU"]
class_names = ["S", "W", "A", "B", "C", "D"]

for impl in impls:
     cp_command = "cp "+base_dir+impl+"/make.def "+base_dir+ver_dir+ver_short+"-"+impl+"/config/"
     print cp_command
     os.system(cp_command)
     for bn in benchmark_names:
         for cn in class_names:
             for core_num in [1,2,4,8]:
                 make_command = "cd "+base_dir+ver_dir+ver_short+"-"+impl+"/;make "+bn
                 if impl == "MPI":
                     make_command += " NPROCS="+str(core_num)
                 elif core_num>1:
                     break
                 make_command += " CLASS="+cn
                 os.system(make_command)


