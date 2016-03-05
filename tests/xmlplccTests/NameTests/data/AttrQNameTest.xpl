node[] main() {
  prefix p = Prefix("prefix", "http://example.com");

  <x ("attribute")="value" (QName(p, "attribute"))="value" (p):("attr2")="value"/>
  "\n";
}
