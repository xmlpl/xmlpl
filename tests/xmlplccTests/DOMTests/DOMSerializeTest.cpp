#include <iostream>

#include <BasicUtils/BasicException.h>

#include <xmlpl/cpp/runtime/LibXML2XMLStream.h>
#include <xmlpl/cpp/runtime/dom/DOMFactory.h>

using namespace std;
using namespace xmlpl;

int main(int argc, char *argv[]) {
  try {
    DOMFactory factory;
    LibXML2XMLStream out(cout);
    
    Element *root;
    root = factory.createElement(factory.createQName(xmlCharStrdup("root")));
    
    root->setAttribute(factory.createAttribute(factory.createQName(xmlCharStrdup("name")),
					       xmlCharStrdup("value")));
    
    Node *node = factory.createText(xmlCharStrdup("Some text"));
    
    root->setFirstChild(node);
    
    node->setNext(factory.createComment(xmlCharStrdup("A comment")));
    node = node->getNext();
    
    node->setNext(factory.createPI(xmlCharStrdup("target"), xmlCharStrdup("data")));
    node = node->getNext();
    
    node->setNext(factory.createElement(factory.createQName(xmlCharStrdup("child"))));
    
    out.startDocument();
    root->serialize(out);
    out.endDocument();

    return 0;

  } catch (const BasicException &e) {
    cerr << e << endl;
  }

  return 1;
}
