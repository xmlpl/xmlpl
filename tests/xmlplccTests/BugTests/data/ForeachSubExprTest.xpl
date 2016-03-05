import xmlpl.xml;
import xmlpl.string;

string[] main(document in) {
  real amount = 0;
  prefix ns = Prefix("", "http://recipes.org");

  foreach (decendant_or_self(in/*, QName(ns, "ingredient"))[@name == "flour"])
    amount += ator(value(@amount));

  amount + "\n";
}
