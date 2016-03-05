#include <iostream>

#include <BasicUtils/BasicSmartPointer.h>

#include <xmlpl/cpp/runtime/LibXML2XMLStream.h>
#include <xmlpl/cpp/runtime/dom/DOMFactory.h>

using namespace std;
using namespace xmlpl;

int main(int argc, char *argv[]) {
  try {
    DOMFactory factory;
    LibXML2XMLStream out(cout);
    
    out.startDocument();
    out.startElement(factory.createQName(xmlCharStrdup("root")));
    
    out.attribute(factory.createQName(xmlCharStrdup("name")), xmlCharStrdup("value"));
    
    out.text(xmlCharStrdup("Some text"));
    
    out.comment(xmlCharStrdup("A comment"));
    
    out.pi(xmlCharStrdup("target"), xmlCharStrdup("data"));
    
    out.startElement(factory.createQName(xmlCharStrdup("child")));
    out.endElement();
    
    out.endElement();
    out.endDocument();

    return 0;
  } catch (BasicException &e) {
    cerr << e << endl;
  }
  
  return 1;
}
