lib_XMLPLCC =\
	libhello-0.0.1.la\
	libhello-0.0.2.la\
	libhello-0.0.3.la\
	libhello-0.0.4.la\
	libhello2-0.0.1.la\
	libbyref-0.0.1.la

all: $(lib_XMLPLCC)

lib%.la: %.xpl $(XMLPLCC)
	xmlplcc -l -L -rpath -L `pwd`/test $<
	libtool --mode=install install -D $@ `pwd`/test/$@

clean:
	rm -f *.o *.cpp test/* $(lib_XMLPLCC)
