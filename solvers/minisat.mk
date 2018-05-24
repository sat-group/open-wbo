VERSION    = core
SOLVERNAME = "Minisat"
SOLVERDIR  = minisat
NSPACE     = Minisat

# Github Minisat is structured differently, hence add another level in the indirections
DEPDIR     += ../../../encodings ../../../algorithms ../../../graph ../../../classifier
MROOT      = $(PWD)/solvers/$(SOLVERDIR)/minisat
CFLAGS     += -I .. -I ../.. -I ../../.. -I solvers/minisat -g3
LFLAGS     += -lpthread -lz -lrt

# Minisat has the ability to reserve variables in a range
CFLAGS     += -DSAT_HAS_RESERVATION -DMINISAT_CONSTANTS_AS_MACROS

# The streambuffer class resides in it's own file
CFLAGS     += -DHAS_EXTRA_STREAMBUFFER
