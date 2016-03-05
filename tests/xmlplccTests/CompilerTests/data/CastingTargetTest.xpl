integer[] f() {
  1; 2; 3; 4; 5;
}

node[] main() {
  (: From node[]uence stream to node[]uence variable cast :)
  node[] s = f();
  s; "\n";
  
  (: From node[]uence variable to stream cast :)
  integer[] x = f();
  x; "\n";
  
  (: From node[]uence stream to node[]uence stream cast :)
  f(); "\n";
}
