integer f(integer x, string y) {}
string f(integer x, integer y) {}

node[] main() {
  f(1, f(1, "test"));
}
