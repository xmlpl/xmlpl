#include <iostream>
#include <string>
using namespace std;

char *ops[] = {
  "||",
  "&&",
  "|",
  "^",
  "&",
  "==",
  "<",
  ">",
  "<=",
  ">=",
  ">>",
  "<<",
  "+",
  "-",
  "*",
  "/",
  "%",
  0
};

char *types[] = {
  "node[]",
  "int",
  "real",
  "bool",
  "str",
  "doc",
  "elem",
  "attr",
  "comm",
  "pi",
  "text",
  "pre",
  "qname",
  "node",
  "int[]",
  "real[]",
  "bool[]",
  "str[]",
  "doc[]",
  "elem[]",
  "attr[]",
  "comm[]",
  "pi[]",
  "pre[]",
  "qname[]",
  "text[]",
  0
};

string typeName(const unsigned int i) {
  string name = types[i];

  name[0] = (char)(name[0] - 32);

  for (unsigned int i = 0; i < name.length(); i++)
    switch (name[i]) {
    case ' ': name[i] = '_'; break;
    case '[': name[i] = 'S'; break;
    case ']': name[i] = ' '; break;
    }

  return name;
}

#define TYPE_NAME(x) (char)(types[x][0] - 32) << &types[x][1]

int main(int argc, char *argv[]) {
  cout << "node[] main() {" << endl;

  for (int i = 0; types[i]; i++)
    cout << "\t" << types[i] << " " << typeName(i) << ";" << endl;

  cout << endl;

  for (int i = 0; types[i]; i++)
    for (int j = 0; types[j]; j++)
      for (int k = 0; ops[k]; k++)
	cout << "\t" << typeName(i) << " " << ops[k] << " " << typeName(j) << ";" << endl;


  cout << "}" << endl << endl;
  return 0;
}
