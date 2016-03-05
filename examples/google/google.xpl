import xmlpl.process;

node[] main(string[] args) {
  if (size(args) < 2) {
    "Syntax: ", args[0], " <search string> [num results]\n";
    return;
  }

  <results search=(args[1])>
     string command = "wgetXHTML 'http://www.google.com/search?q=" + args[1];
     if (size(args) > 2) command += "&num=" + args[2];
     command += "'";

    foreach (systemXML(command)/html/body/div/p[@class=="g"]/a[0]) "\n  ", .;
    "\n";
  </results>
  "\n";
}
