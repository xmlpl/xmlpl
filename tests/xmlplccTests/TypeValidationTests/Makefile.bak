SYMLINKED_TESTS =\
	InvalidAssignmentTest\
	BinaryOpTypeTest\
	UnaryOpTypeTest\
	CaseMismatchTest\
	DuplicateCaseTest\
	EmptyDefaultTest\
	InvalidExplicitCast

all: $(PROGRAMS)
	for i in $(SYMLINKED_TESTS); do ln -fs ../prettyXMLParser $$i; done

PROGRAMS =\
  genBinaryOpType\
  genUnaryOpType

%: %.xpl
	xmlplcc $<

clean:
	rm -rf $(SYMLINKED_TESTS) $(PROGRAMS)
