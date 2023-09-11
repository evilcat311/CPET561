# Dr. Kaputa
# Quartus II compile script for DE1-SoC board

# 1] name your project here
set project_name "assembly_demo"

file delete -force project
file delete -force output_files
file mkdir project
cd project
load_package flow
project_new $project_name
set_global_assignment -name FAMILY Cyclone
set_global_assignment -name DEVICE 5CSEMA5F31C6 
set_global_assignment -name TOP_LEVEL_ENTITY assembly_demo
set_global_assignment -name PROJECT_OUTPUT_DIRECTORY ../output_files

# 4] import pin assigment from file

# Specify the path to the .qsf file
set qsf_file_path ../DE1_SoC.qsf

# Open the .qsf file for reading
set qsf_file [open $qsf_file_path "r"]

# Read and process each line in the .qsf file
while {[gets $qsf_file line] != -1} {
    # Skip comments and empty lines
    if {[string match "#*" $line] || [string equal $line ""]} {
        continue
    }
    
    # Skip lines starting with set_global_assignment
    if {[string match "set_global_assignment*" $line]} {
        continue
    }
    
    catch { eval $line}
}

# Close the .qsf file
close $qsf_file

#execute_flow -compile
project_close


