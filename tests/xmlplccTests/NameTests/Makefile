SYMLINKED_TESTS =\
	MinusInNameTest\
	CreatePrefixTest\
	CreateQNameTest\
	ElemQNameTest\
	AttrQNameTest\
	PrefixNameTest\
	UndeclaredPrefixTest

all:
	for i in $(SYMLINKED_TESTS); do ln -fs ../compiler $$i; done

check:
	../../testHarness

clean:
	rm -f $(SYMLINKED_TESTS)
