import xmlpl.xml;

string[] main() {
  attribute a1 = Attribute("test1", "test1");
  attribute a2 = Attribute("test1", "test1");
  attribute a3 = Attribute("test2", "test2");

  a1 == a1; "\n";
  a1 == a2; "\n";
  a1 == a3; "\n";
  a1 == "test1"; "\n";
  a1 == "test2"; "\n";
}
