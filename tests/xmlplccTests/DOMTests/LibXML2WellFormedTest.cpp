#include <iostream>

#include <BasicUtils/BasicException.h>
#include <xmlpl/cpp/runtime/LibXML2XMLStream.h>
#include <xmlpl/cpp/runtime/LibXML2XMLSource.h>
#include <xmlpl/cpp/runtime/main.h>

using namespace std;
using namespace xmlpl;

int main(int argc, char *argv[]) {
  try {
    xmlplInit();
    
    DOMFactory factory;
    IStreamDataSource input(cin);
    LibXML2XMLSource in(&input, &factory);
    LibXML2XMLStream out(cout);

    while (in.pump(&out));

    return 0;

  } catch (const BasicException &e) {
    cerr << e << endl;
  } catch (...) {
    cerr << "Caught unknown exception." << endl;
  }

  return 1;
}
