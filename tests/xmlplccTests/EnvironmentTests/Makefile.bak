SYMLINKED_TESTS =\
	VarDeclTest\
	DupVarDeclTest\
	VarRefTest\
	BadVarRefTest\
	VarDeclShadowTest\
	XMLScopeTest\
	FuncDeclTest\
	FuncOverloadTest\
	DupFuncTest\
        DupFunc2Test\
	DupFuncArgsTest\
	FuncArgRefTest\
	FuncArgShadowTest\
	FuncCallTest\
	FuncOnlyReturnTest\
	FuncUndeclTest\
	NotAFuncTest\
	OverloadedCallTest\
	NoMatchingCallTest\
	AmbiguousCallTest\
	CastableCallTest\
	FuncExtendTest\
	FuncForwardDeclTest

all:
	for i in $(SYMLINKED_TESTS); do ln -fs ../prettyXMLParser $$i; done

check:
	../../testHarness

clean:
	rm -f $(SYMLINKED_TESTS)
