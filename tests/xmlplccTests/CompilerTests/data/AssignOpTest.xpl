node[] main() {
  real a = 1;
  real b = 2;
  integer c = 3;
  integer d = 4;

  a *= b /= c += d %= 3;
  "a = "; a; "\n";
  "b = "; b; "\n";
  "c = "; c; "\n";
  "d = "; d; "\n";
}
