CC := g++
SRCD := src
BLDD := build
INCD := include

ALL_SRCF := $(shell find $(SRCD) -type f -name *.cpp)
ALL_OBJF := $(patsubst $(SRCD)/%,$(BLDD)/%,$(ALL_SRCF:.cpp=.o))

INC := -I $(INCD)

CFLAGS := -Wall -Werror -Wno-unused-variable -Wno-unused-function -MMD
COLORF := -DCOLOR
DFLAGS := -g -DDEBUG -DCOLOR
PRINT_STAMENTS := -DERROR -DSUCCESS -DWARN -DINFO

.PHONY: clean all setup debug

MONTE := MonteCarloSolver

all: setup $(MONTE)

debug: CFLAGS += $(DFLAGS) $(PRINT_STAMENTS) $(COLORF)
debug: all

setup: $(BLDD)
$(BLDD):
	mkdir -p $(BLDD)

$(MONTE): $(ALL_OBJF)
	$(CC) $^ -o $@

$(BLDD)/%.o: $(SRCD)/%.cpp
	$(CC) $(CFLAGS) $(INC) -c -o $@ $<

clean:
	rm -rf $(BLDD)

.PRECIOUS: $(BLDD)/*.d
-include $(BLDD)/*.d