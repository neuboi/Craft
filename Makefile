INCLUDE=-I /Users/fogleman/Workspace/glfw-2.7.8/include
LIBRARY=-L /Users/fogleman/Workspace/glfw-2.7.8/lib/cocoa
FLAGS=-std=c99 -O3

all: main

run: all
	./main

clean:
	rm *.o

main: main.o util.o noise.o map.o
	gcc $(FLAGS) main.o util.o noise.o map.o -o main $(LIBRARY) -lglfw -framework Cocoa -framework OpenGL

main.o: main.c
	gcc $(FLAGS) $(INCLUDE) -c -o main.o main.c

util.o: util.c util.h
	gcc $(FLAGS) $(INCLUDE) -c -o util.o util.c

noise.o: noise.c noise.h
	gcc $(FLAGS) $(INCLUDE) -c -o noise.o noise.c

map.o: map.c map.h
	gcc $(FLAGS) $(INCLUDE) -c -o map.o map.c
