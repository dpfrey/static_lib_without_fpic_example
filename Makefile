CC?=gcc
AR?=ar
RM?=rm -f

test: main.o libsaythings/libsaythings.so
	$(CC) -o test main.o -Llibsaythings -lsaythings

main.o: main.c
	$(CC) -c -Ilibsaythings main.c

libsaythings/%.o: libsaythings/%.c
	$(CC) -c -Ilibgreeting -fpic -o $@ $<

libsaythings/libsaythings.so: libsaythings/saythings.o libgreeting/libgreeting.a
	$(CC) -shared -o $@ $^

libgreeting/%.o: libgreeting/%.c
	# with -fpic: works
	#$(CC) -c -fpic -o $@ $<
	# without -fpic: fails
	$(CC) -c -o $@ $<

libgreeting/libgreeting.a: libgreeting/hello.o libgreeting/goodbye.o
	ar rcs $@ $?

clean:
	$(RM) test
	$(RM) *.o
	$(RM) libsaythings/*.o
	$(RM) libsaythings/libsaythings.so
	$(RM) libgreeting/*.o
	$(RM) libgreeting/libgreeting.a
