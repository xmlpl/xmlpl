import xmlpl.xml;

node[] main() {
  element x = <x><y/><z/></x>;

  integer i;
  element e = <element>
    for (i = 0; i < 10; i++) x/y;
  </element>;

  e; "\n";
  x; "\n";
}
