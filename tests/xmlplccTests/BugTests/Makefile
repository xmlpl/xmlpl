SYMLINKED_TESTS =\
  ForeachXPathReturnTest\
  ForeachXPathContinueTest\
  ForeachXPathBreakTest\
  SwitchQNameTest\
  AttributeCompareTest\
  ParentedAppendTest\
  DoubleFilterTest\
  ParseSegFaultTest\
  ForeachSubExprTest

all:
	for i in $(SYMLINKED_TESTS); do ln -fs ../compiler $$i; done

check:
	../../testHarness

clean:
	rm -rf $(SYMLINKED_TESTS)
