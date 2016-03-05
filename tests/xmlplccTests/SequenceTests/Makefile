SYMLINKED_TESTS =\
	SequenceIterationTest\
	SequenceItemAssignTest\
	NullInSequenceTest\
	SequenceExprTest\
	CommaAssignTest\
	InvalidCommaAssign

all:
	for i in $(SYMLINKED_TESTS); do ln -fs ../compiler $$i; done

check:
	../../testHarness

clean:
	rm -f $(SYMLINKED_TESTS)
