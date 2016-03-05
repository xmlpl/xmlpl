SYMLINKED_TESTS =\
	RedirectTest\
	RedirectNodeTest

all:
	for i in $(SYMLINKED_TESTS); do ln -fs ../compiler $$i; done

check:
	../../testHarness

clean:
	rm -f $(SYMLINKED_TESTS)
