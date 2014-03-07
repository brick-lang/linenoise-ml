all:liblinenoise.a

liblinenoise.a: linenoise.o
	ar $@ $<

linenoise.o: linenoise.c
	$(CC) $< -o $@