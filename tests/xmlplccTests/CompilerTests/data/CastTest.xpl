integer[] f(integer x) {1;}
integer[] f(string x) {2;}

node[] main() {
  integer x = 10;

  (string)x; "\n";

  f(1); "\n";
  f((string)1); "\n";
}
