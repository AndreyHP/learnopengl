# Variables
MAIN = $(wildcard ./src/*cpp) ./src/*.c
TARGET = main
OUTDIR = debug
INCLUDE = -I:./include
CXX = g++
CXXFLAGS = -std=c++23 -Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion -O0 -pedantic-errors
LINKER = -lglfw -lGL -lX11 -lpthread -lXrandr -lXi -ldl

# Add -ggdb to the command line for debug builds and -O2 -DNDEBUG
# -pedantic-errors disable compiler extensions 
# -Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion Extra warnings
# -Werror Treat warnings as errors

# Default target
all: $(OUTDIR)/$(TARGET)

# Rule to compile and link the executable
$(OUTDIR)/$(TARGET): $(MAIN) | $(OUTDIR)
	$(CXX) $(CXXFLAGS) $(INCLUDE) $(MAIN) -o $(OUTDIR)/$(TARGET) $(LINKER)

# Ensure the output directory exists
$(OUTDIR):
	mkdir -p $(OUTDIR)

# Run program
run:
	./$(OUTDIR)/$(TARGET)

# Clean target
clean:
	rm -rf $(OUTDIR)

.PHONY: all clean

