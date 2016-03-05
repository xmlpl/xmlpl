node[] f(boolean x) {
  try {
    if (x) throw "Hello World!";
  } catch {
    "Exception:"; line; ":"; column; ":"; error; "\n";
  }
}

node[] main() {
  f(true);
  f(false);
}
