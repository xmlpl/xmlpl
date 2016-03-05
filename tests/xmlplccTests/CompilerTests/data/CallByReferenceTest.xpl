void inc(integer &x) {x++;}
void set(string[] &s1, string[] s2) {s1 = s2;}
void setNoRef(string[] s1, string[] s2) {s1 = s2;}

string[] main() {
  integer x = 1;
  inc(x);
  x, "\n";

  string[] seq;
  set(seq, ("hello", " ", "world", "\n"));
  setNoRef(seq, ("oops", "\n"));

  seq;
}
