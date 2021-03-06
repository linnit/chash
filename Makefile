CC=gcc
FLAGS=-Wall -Wextra -Wshadow -std=c99 -g -O3 -Wno-unused-variable -Wno-unused-parameter
LIBS=-lpng -ljpeg
BIN=/usr/bin/
OBJS=./bin/chash_png.o ./bin/chash_jpeg.o

all: ./src/main.c ${OBJS}
	${CC} ./src/main.c ${OBJS} ${FLAGS} ${LIBS} -o ./bin/chash

bin/chash_png.o: ./src/chash_png.c ./src/chash_png.h
	$(CC) -c ./src/chash_png.c ${FLAGS} ${LIBS} -o ./bin/chash_png.o 

bin/chash_jpeg.o: ./src/chash_jpeg.c ./src/chash_jpeg.h
	$(CC) -c ./src/chash_jpeg.c ${FLAGS} ${LIBS} -o ./bin/chash_jpeg.o 

install:
	cp ./bin/chash /usr/local/bin/chash

uninstall:
	rm -f /usr/local/bin/chash

clean:
	rm ./bin/*
