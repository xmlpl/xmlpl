SYMLINKED_TESTS =\
	EmptyTest\
	CommentTest\
	SingleLineCommentTest\
	LexStringTest\
	LexNumberTest\
	LexNameTest\
	FunctionDeclTest\
	VariableDeclTest\
	TypesTest\
	ThrowStmtTest\
	AttrStepsTest\
	PIStepsTest\
	ParentStepTest\
	ChildStepTest\
	DivPathOperatorTest\
	PathTest\
	AbbrevDescendantOrSelfTest\
	AxesTest\
	AttributeTest\
	ConstantsTest\
	AssignmentTest\
	AssignOpTest\
	ImportDeclTest\
	AppendNoEffectTest\
	InvalidReturnTest\
	FuncSeqArgsTest

all:
	for i in $(SYMLINKED_TESTS); do ln -fs ../prettyXMLParser $$i; done

check:
	../../testHarness

clean:
	rm -f $(SYMLINKED_TESTS)
