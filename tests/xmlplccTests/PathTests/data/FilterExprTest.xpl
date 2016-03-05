integer[] f() {
  1; 2; 3; 4; 5;
}

string[] main() {
  integer[] x = f()[. % 2 == 1];

  x; "\n";
  f()[. % 2 == 1]; "\n";
}
