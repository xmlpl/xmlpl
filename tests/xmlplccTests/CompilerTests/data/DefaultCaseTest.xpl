node[] f(string x) {
  switch (x) {
  case "1": "your "; break;
  case "2": "boat "; break;
  default: "row ";
  }
}

node[] g(integer x) {
  switch (x) {
  case 1: "your "; break;
  case 2: "boat "; break;
  default: "row ";
  }
}


node[] main() {
  f("x");
  f("x");
  f("x");
  f("1");
  f("2");
  "\n";
  g(0);
  g(0);
  g(0);
  g(1);
  g(2);
  "\n";
}
