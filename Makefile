TOP = top
MAIN = top.topMain
BUILD_DIR = ./build
OBJ_DIR = $(BUILD_DIR)/OBJ_DIR
TOPNAME = top
TOP_V = $(BUILD_DIR)/verilog/$(TOPNAME).v

SCALA_FILE = $(shell find ./src/main -name '*.scala')

VERILATOR = verilator
VERILATOR_COVERAGE = verilator_coverage
# verilator flags
VERILATOR_FLAGS += -Wall -MMD --trace --build -cc --exe \
									 -O3 --x-assign fast --x-initial fast --noassert -report-unoptflat

# timescale set
VERILATOR_FLAGS += --timescale 1us/1us

verilog:
	@mkdir -p $(BUILD_DIR)/verilog
	mill -i $(TOP).runMain $(MAIN) -td $(BUILD_DIR)/verilog --emit-modules verilog

vcd ?= 
ifeq ($(vcd), 1)
	CFLAGS += -DVCD
endif

# C flags
INC_PATH += $(abspath ./sim_c/include)
INCFLAGS = $(addprefix -I, $(INC_PATH))
CFLAGS += $(INCFLAGS) $(CFLAGS_SIM) -DTOP_NAME="V$(TOPNAME)"

# source file
CSRCS = $(shell find $(abspath ./sim_c) -name "*.c" -or -name "*.cc" -or -name "*.cpp")

BIN = $(BUILD_DIR)/$(TOP)
NPC_EXEC := $(BIN)

sim: $(CSRCS) verilog
	@rm -rf $(OBJ_DIR)
	$(VERILATOR) $(VERILATOR_FLAGS) -top $(TOPNAME) $(CSRCS) $(wildcard $(BUILD_DIR)/verilog/*.v) \
		$(addprefix -CFLAGS , $(CFLAGS)) $(addprefix -LDFLAGS , $(LDFLAGS)) \
		--Mdir $(OBJ_DIR) -o $(abspath $(BIN))

run:
	@echo
	@echo "------------ RUN --------------"
	$(NPC_EXEC)
ifeq ($(vcd), 1)
	@echo "----- see vcd file in logs dir ----"
else
	@echo "----- if you need vcd file. add vcd=1 to make ----"
endif
	
srun: sim run

clean:
	-rm -rf $(BUILD_DIR) logs

clean_mill:
	-rm -rf out

clean_all: clean clean_mill

.PHONY: clean clean_all clean_mill srun run sim verilog
