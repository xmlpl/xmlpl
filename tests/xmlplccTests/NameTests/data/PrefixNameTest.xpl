node[] main(document in) {
  prefix p = Prefix("prefix", "http://example.com/");
  in/root/p:child; "\n";
  in/root/child; "\n";
  in/root/*:child; "\n";
}
