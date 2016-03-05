PROGRAMS =\
  LibXML2XMLStreamTest\
  DOMSerializeTest\
  LibXML2WellFormedTest

all: $(PROGRAMS)

%: %.cpp
	$(CXX) $(shell libxmlpl_cpp_runtime-config --cflags --libs) -MMD -MP -MF .dep/$(@F).d $< -o $@

clean:
	rm -f $(PROGRAMS)

-include $(shell mkdir .dep 2>/dev/null) $(wildcard .dep/*.d)
