VERSION    = core
SOLVERNAME = "Riss"
SOLVERDIR  = riss
NSPACE     = Riss

# Riss is based on cmake, and located somewhere else, and relies on coprocessor, and requires more libraries
DEPDIR     += ../../../encodings ../../../algorithms ../../../graph ../../../classifier ../coprocessor  ../coprocessor/techniques
MROOT      = $(PWD)/solvers/$(SOLVERDIR)/riss
CFLAGS     += -I .. -I ../.. -I ../../.. -I solvers/riss -I ../coprocessor -g3
CFLAGS     += -Wno-delete-non-virtual-dtor -Wno-unused-variable -Wno-sign-compare -Wno-parentheses -Wno-unused-but-set-variable -Wno-reorder
LFLAGS     += -lpthread -lz -lrt

# Riss has the ability to reserve variables in a range
CFLAGS     += -DSAT_HAS_RESERVATION
