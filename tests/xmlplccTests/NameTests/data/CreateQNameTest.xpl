string[] main() {
  prefix p = Prefix("prefix", "http://example.com");
  qname q1 = QName(p, "test");
  qname q2 = QName("test");

  q1; "\n";
  q2; "\n";
}
