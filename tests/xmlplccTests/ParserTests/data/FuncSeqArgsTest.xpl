integer f(integer[] s, integer x, integer y) {}
integer g(integer a, integer b, integer[] c) {}

node[] main() {
  f((1, 2, 3), 4, 5);
  g(1, 2, (3, 4, 5));
}
