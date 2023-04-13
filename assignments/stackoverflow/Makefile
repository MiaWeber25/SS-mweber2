COMPILER = g++

COMPILER_FLAGS = -g -Wall -m32 -fno-stack-protector -z execstack

PROGRAM_NAME = StackOverflowHW.exe

CPP_FILES = StackOverflowHW.cpp

build:
	$(COMPILER) $(COMPILER_FLAGS) $(CPP_FILES) -o $(PROGRAM_NAME)
	sudo chown root:root $(PROGRAM_NAME)
	sudo chmod +s $(PROGRAM_NAME) 

clean:
	rm -f $(PROGRAM_NAME) *.o

