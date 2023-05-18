.PHONY: all clean compile sim

all: compile

clean:
	rm -fr work
	rm -f transcript
	rm -f *.wlf
	rm -f modelsim.ini

compile:
	@vsim -c -do "do scripts/compile.do;quit -f"

sim:
	@vsim -c -t ps work.tb -quiet -do "run -all;quit -f" | grep -E "\*\*|Errors"
