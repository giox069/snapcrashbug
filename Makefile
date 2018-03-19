

NAME=prova1

CFLAGS=-g -Wall -o $(NAME)
SRCS=test.c
GTKFLAGS=`pkg-config --cflags gtk+-3.0` `pkg-config --cflags --libs gtk+-3.0`

all: prova1

prova1: $(SRCS)
	$(CC) $(CFLAGS) $(SRCS) $(GTKFLAGS)

clean:
	/bin/rm -f $(NAME)

install: prova1
	mkdir -p $(DESTDIR)/bin
	/usr/bin/install $(NAME) $(DESTDIR)/bin/$(NAME)



