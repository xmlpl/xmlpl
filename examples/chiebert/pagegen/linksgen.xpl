import xmlpl.xml;

node[] processtree(element e) {
 (: this section outputs every sub-node of our selected node :)
    <(name(e))>
	e/@*;
	foreach(e/node()) {
	  if (Element(.)) processtree(Element(.));
	  else .;
	}
	</>
}
node[] outputfolder(element folderin) {
<DD><H1>"LINKS";</H1>
	<(name(folderin))>
		folderin/@*;
		foreach(folderin/node()) {
			if (Element(.)) processtree(Element(.));
			else .;
		}
	</>	
</DD>
}

node[] main(document in, string[] args) {
<DD>
  string LinkName = args[1];
  integer indx;
  element[] folders = in/html/body/dl/dd/*;
  integer foundfolder = 0;
  
  (:  Builds a list of Links using the same formatting from the bookmarks file. :)
   for (indx=0; indx< size(folders); indx++) {
      switch (name(folders[indx])) {
        case "h1": case "h2": case "h3": case "h4": case "h5": case "h6": 
			if (folders[indx]/text() == LinkName)      
      			foundfolder = indx+1;
        break;
      }
	  if (foundfolder != 0) break;
	}
    if (foundfolder != 0) 
      outputfolder(folders[foundfolder]);

</DD>
}

