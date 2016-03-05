import xmlpl.xml;

string[] main() {
  element e = <e><e><e test1="" test2=""/></e></e>;

  foreach (e/e/e/@*) {
    name(.); "\n";
    if (. == "") break;
  }

  "done\n";
}
