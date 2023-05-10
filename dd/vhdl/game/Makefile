

VCOM_ARGS=-2008 -work work -suppress 1236
VSIM_ARGS=-msgmode both

# The order is important!
VHDL_FILES = \
	../math/src/math_pkg.vhd\
	../gfx_cmd/src/gfx_cmd_pkg.vhd\
	../gfx_cmd/tb/vram_pkg.vhd\
	../gfx_cmd/src/interpreter_pkg.vhd\
	../dualshock_ctrl/src/dualshock_pkg.vhd\
	../mem/src/mem_pkg.vhd\
	../audio_ctrl/src/audio_ctrl_pkg.vhd\
	./src/gfx_init_pkg.vhd\
	../gfx_cmd/src/interpreter_pkg.vhd\
	../decimal_printer/src/decimal_printer_pkg.vhd\
	../gfx_cmd/tb/gfx_cmd_interpreter.template.vhd\
	../mem/src/dp_ram_1c1r1w.vhd\
	../game_util/src/game_util_pkg.vhd\
	../game_util/src/sifield.vhd\
	../game_util/src/shot_ctrl.vhd\
	../decimal_printer/src/decimal_printer.vho\
	./src/game.vhd\
	./src/game_ex2.vhd

TB_FILES = \
	./tb/game_tb.vhd\

TIME_RESOLUTION = 1ps
TB = game_tb

# For the simulation time -all can also be selected. Questa then simulates until no more singal changes occour.
SIM_TIME = -all
WAVE_FILE =

compile: log 

log: $(VHDL_FILES) $(TB_FILES)
	rm -f log
	vlib work | tee log
	for i in $(VHDL_FILES); do \
		vcom $(VCOM_ARGS) $$i | tee -a log;\
	done;
	for i in $(TB_FILES); do \
		vcom $(VCOM_ARGS) $$i | tee -a log;\
	done;
	@echo "--------------------------------------------------------------"
	@echo "--              Error and Warning Summary                   --"
	@echo "--------------------------------------------------------------"
	@cat log | grep 'Warning\|Error'
	@if [[ $$(grep "Error:" -m 1 log) ]]; then \
		echo "Compilation had errors!" \
		exit 1; \
	fi;

list_sources:
	@for i in $(VHDL_FILES) $(TB_FILES); do \
		echo $$i;\
	done;

sim_gui: compile
	vsim -do "vsim $(TB) -t $(TIME_RESOLUTION) $(VSIM_ARGS); do $(WAVE_FILE);run $(SIM_TIME)" 

sim: compile
	vsim -c -do "vsim $(TB) -t $(TIME_RESOLUTION) $(VSIM_ARGS); run $(SIM_TIME);quit"

clean:
	rm -f transcript
	rm -f vsim.wlf
	rm -f log
	rm -fr work
	rm *.ppm

.PHONY: clean
.PHONY: compile
.PHONY: sim
.PHONY: sim_gui



