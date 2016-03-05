import xmlpl.xml;
import xmlpl.process;
import xmlpl.stdio;


  node[] systemXMLWrap(string cmd) {
   (: in this section we are using sed to wrap a non-xml command into an xml node :)
    systemXML(
      "echo -n '<root>';" +
      cmd + " | sed 's/&/\\&amp;/g;s/</\\&lt;/g;s/>/\\&gt;/g';" +
      "echo -n '</root>'"
    )/root/node();
  }
  
string get_text(text[] t) {
  string result;
(: This is needed because the text is split into multiple strings. 
   Here we are recombining those strings :)
  foreach (t) result += .;

  return result;
}


node[] genpage(element e) {
 
  switch (name(e)) {
  case "command":
    if (e/@wrap == "true")
      systemXMLWrap(get_text(e/text()));
    else 
       systemXML(get_text(e/text()))/*; 
    break;
    
  default:
  (: if the name of the tag is not one of the defined special tags just send it into the output :)
    <(name(e))>
      e/@*;
      foreach (e/node()) {
        if (Element(.)) genpage(Element(.));
        else .;
      }
    </>
    break;
  } 
}

node[] main(document in, string[] args) {
  "Content-type: text/html\n\n";
  (: Open the template xml file :)
  genpage(open("template.xml")/*);
}
