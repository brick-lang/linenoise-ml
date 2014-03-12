all:liblinenoise.a

liblinenoise.a: linenoise.o
	ar rcs $@ $<

linenoise.o: linenoise.c
	$(CC) -c $< -o $@

clean:
	rm -f linenoise.o liblinenoise.a