TARGETS=webPictures

all: $(TARGETS)

%: %.xpl
	xmlplcc $<

tidy:
	rm -f *~ \#*

clean: tidy
	rm -f $(TARGETS)
