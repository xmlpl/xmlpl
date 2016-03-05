#include <iostream>
using namespace std;

char *ops[] = {
  "!",
  "-",
  "+",
  "++",
  "--",
  "~",
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
  0
};

#define TYPE_NAME(x) (char)(types[x][0] - 32) << &types[x][1]

int main(int argc, char *argv[]) {
  cout << "node[] main() {" << endl;

  for (int i = 0; types[i]; i++)
    cout << "\t" << types[i] << " " << TYPE_NAME(i) << ";" << endl;

  cout << endl;

  for (int i = 0; types[i]; i++)
      for (int k = 0; ops[k]; k++)
	cout << "\t" << ops[k] << TYPE_NAME(i) << ";" << endl;


  cout << "}" << endl << endl;
  return 0;
}
