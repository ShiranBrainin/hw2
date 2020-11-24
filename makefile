CC=gcc									# gcc is the compiler
CCLINK=$(CC) 							# Read variable CC using $(CC)
CFLAGS=-g -Wall -std=c99				# flags for the compiler
OBJS=main.o file0.o file1.o file2.o file3.o file4.o #all of out object files
EXEC=prog.exe 										#our execute file
RM=rm -rf *.o *.exe 								# make clean command

#linker command, creates the execute file from the objects file
$(EXEC): $(OBJS)					
	$(CCLINK) $(OBJS) -o prog.exe

# compiler commands
# The rules we made for compiling into object files, according to the dependency graph of our files
main.o: main.c file0.h file1.h file2.h file3.h file4.h
	$(CC) $(CFLAGS) -c main.c

file0.o: file0.c file0.h file1.h file3.h
	$(CC) $(CFLAGS) -c file0.c

file1.o: file1.c file1.h file2.h file3.h
	$(CC) $(CFLAGS) -c file1.c

file2.o: file2.c file2.h file0.h file1.h file3.h
	$(CC) $(CFLAGS) -c file2.c

file3.o: file3.c file3.h file0.h file1.h file2.h
	$(CC) $(CFLAGS) -c file3.c

file4.o: file4.c file4.h file0.h file3.h
	$(CC) $(CFLAGS) -c file4.c

# the command "make clean" will call this rule
clean:
	$(RM)			#reading the variable RM

