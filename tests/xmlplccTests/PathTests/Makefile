SYMLINKED_TESTS =\
	ChildAxisTest\
	AttributeAxisTest\
	PredicateTest\
	BooleanTargetTest\
	StringTargetTest\
	AttributeCompareTest\
	PathWithVarRefTest\
	PathIntPredTest\
	IntFilterExprTest\
	FilterExprTest\
	InvalidFilterContextRefTest\
	ForeachTest\
	NonFilterForeachTest\
	ParentAxisTest

all:
	for i in $(SYMLINKED_TESTS); do ln -fs ../compiler $$i; done

check:
	../../testHarness

clean:
	rm -f $(SYMLINKED_TESTS)
