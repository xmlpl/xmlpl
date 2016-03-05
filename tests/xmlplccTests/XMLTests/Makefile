SYMLINKED_TESTS =\
	ElementTest\
	CommentTest\
	PITest\
	ElementExprTest\
	ElemStmtTest\
	CommentExprTest\
	PIExprTest\
	AssignXMLExprTest

all:
	for i in $(SYMLINKED_TESTS); do ln -fs ../compiler $$i; done

check:
	../../testHarness

clean:
	rm -rf $(SYMLINKED_TESTS)
