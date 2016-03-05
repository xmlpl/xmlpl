SUBDIRS=examples
DIST_SUBDIRS = $(SUBDIRS) tests
ACLOCAL_AMFLAGS = -I config/m4
EXTRA_DIST = autogen.sh config/m4 debian

check:
	$(MAKE) -C tests check

mostlyclean-generic: tidy
	if [ -f tests/Makefile ]; then $(MAKE) -C tests clean; fi

dist-hook:
	rm -rf `find $(distdir) -name CVS -o -name .svn`

tidy:
	-rm -f `find . -name '#*' -o -name '.\#*'\
	  -o -name '.*~' -o -name '*~' -o -name 'core*'`

maintainer-clean-generic:
	-rm -rf core `find . -name '.deps' -o -name 'autom4te*.cache'`
