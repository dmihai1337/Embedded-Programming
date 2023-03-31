#!/bin/bash

dirs_with_no_vhdl_files="
.
vhdl
vhdl/top
vhdl/top/quartus
"

ipcores="
math
sync
mem
audio_ctrl
dualshock_ctrl
game
gfx_cmd
vga_gfx_ctrl
dbg_port
top
"

modules_with_makefiles="
game
gfx_cmd
ssd_ctrl
"

modules_with_makefiles_and_sim_targets="
game
gfx_cmd
ssd_ctrl
"

modules_with_makefiles_and_sim_gui_targets="
ssd_ctrl
"

files_that_should_exist="
vhdl/top/src/top.vhd
vhdl/top/quartus/top.sdc
"

#if [ "$(echo $1)" == "ex2" ]; then
# #nothing to do
#fi;

error_counter=0
warning_counter=0

if [ ! -d vhdl ]; then 
	echo "Error: vhdl directory missing"; 
	let "error_counter++"
fi;

#check files that should have been created during exercise 1
for f in $files_that_should_exist; do
	if [ ! -e "$f" ]; then
		echo "Warning: file $f does not exist"; 
		let "warning_counter++"
	fi;
done;

for core in $ipcores; do 
	if [ ! -d vhdl/$core ]; then 
		echo "Error: module [$core] missing from your source tree"; 
		let "error_counter++"
	fi;
done;

for i in $dirs_with_no_vhdl_files; do 
	for f in $i/*.vhd; do 
		if [ -e "$f" ]; then
			echo "Error: [$f] -- The folder [$i] MUST NOT contain VHDL files. VHDL files may only be put in the src or tb folder of each module"; 
			let "error_counter++"
		fi;
		break;
	done;
done;

for core in $ipcores; do 
	if [ -e "vhdl/$core" ] && [ $(ls vhdl/$core | grep -i "\.vhd" | wc -l) -ne 0 ]; then
		echo "Error: The folder [vhdl/$core] MUST NOT contain VHDL files. VHDL files may only be put in the src or tb folder of each module"; 
	fi;

	for d in vhdl/$core/*; do 
		if [ -d "${d}" ] && [ "$(basename $d)" != "src" ] && [ "$(basename $d)" != "tb" ] ; then
			if [ $(ls $d | grep -i ".vhd" | wc -l) -ne 0 ]; then
				echo "Error: The folder [$d] MUST NOT contain VHDL files. VHDL files may only be put in the src or tb folder of each module"; 
			fi;
		fi
	done;
done;


#check makefiles
for i in $modules_with_makefiles; do 
	if [ ! -e vhdl/$i/Makefile ]; then
		echo "Warning: The makefile for module $i is missing!";
		let "warning_counter++"
	else
		for target in compile clean; do
			if ! [[ $(cat vhdl/$i/Makefile | grep "^$target:") ]]; then
				echo "Warning: The makefile for $i module is missing the $target target!";
				let "warning_counter++"
			fi;
		done;
	fi;
done;

for i in $modules_with_makefiles_and_sim_gui_targets; do 
	if [  -e vhdl/$i/Makefile ]; then
		if ! [[ $(cat vhdl/$i/Makefile | grep "^sim_gui:") ]]; then
			echo "Warning: The makefile for $i module is missing the sim_gui target!";
			let "warning_counter++"
		fi;
	fi;
done;

for i in $modules_with_makefiles_and_sim_targets; do 
	if [  -e vhdl/$i/Makefile ]; then
		if ! [[ $(cat vhdl/$i/Makefile | grep "^sim:") ]]; then
			echo "Warning: The makefile for $i module is missing the sim target!";
			let "warning_counter++"
		fi;
	fi;
done;


#check for quartus projects
for f in vhdl/top/quartus/*.qpf; do 
	if [ ! -e "$f" ]; then
		echo "Error: Quartus project missing!";
		let "error_counter++"
	fi;
	
	if [ ! -e "vhdl/top/quartus/top.qpf" ]; then
		echo "Error: The name of the top-level Quartus project is wrong! The name MUST BE top!";
		let "error_counter++"
	fi;
	break;
done;

#check for SDC file in quartus project directory
for f in vhdl/top/quartus/*.sdc; do 
	if [ ! -e "$f" ]; then
		echo "Warning: SDC file missing in top-level quartus project directory vhdl/top/quartus!";
		let "warning_counter++"
	fi;
	break;
done;

#check for PLL file in top source directory
if [ $(ls vhdl/top/src/ | grep -i PLL | wc -l) -eq 0 ]; then
	echo "Error: PLL file missing from vhdl/top/src directory!";
	let "error_counter++"
fi;

#check for the all keyword
for f in vhdl/ssd_controller/src/*.vhd; do 
	if [ -e "$f" ]; then
		if [ $(cat vhdl/ssd_controller/src/*.vhd | grep process | grep all | wc -l) -ne 0 ]; then 
			echo "Warning: Your ssd_controller seems to use the all keyword for sensitivity lists";
		fi;
	fi;
	break;
done;

exit $error_counter

