SYMLINKED_TESTS =\
	ImportSingleTest\
	ImportFuncArgsTest\
	ImportAsTest\
	ImportVariableTest\
	ImportAsNameClashTest\
	AmbigiousRefTest\
	NonExistantSymbol\
	SameNSError\
	ImportVersionTest\
	VersionRangeTest\
	ImportWithTarget\
	ImportConstantTest\
	ImportCallByRefTest

all:
	for i in $(SYMLINKED_TESTS); do ln -fs ../compiler $$i; done

check:
	../../testHarness

clean:
	rm -f $(SYMLINKED_TESTS)
