node[] main(document in) {
  string value = "value";

  in/root/child[@attr == value && @attr == value]; "\n";
}
