package test.hello 0.0.4;

constant string hello_world = "Hello World!\n";

integer strlen(string s) {
  return length(s);
}

string hello() {
  return hello_world;
}
