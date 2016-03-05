import xmlpl.process;
import xmlpl.xml;
import xmlpl.string;

string baseurl = "http://www.imdb.com";

string[] main(string[] args) {
  if (size(args) < 2 || size(args) > 3) {
    "Syntax: ", args[0], " <query>\n";
    return;
  }

  string query = args[1];

  string command = "wgetXHTML '" + baseurl + "/find?s=nm";
  command += "&q=" + query;
  command += "'";

  ::"@ " + command + "\n";

  document doc = systemXML(command);

  <html>
  <head><title>query;</title></head>
  <body>
  <h1>query;</h1>
  <ol>
  foreach (decendant_or_self(doc/*, "ol")/li) {
    string url = baseurl + value(./a/@href);
    command = "wgetXHTML '" + url + "'";
    document film = systemXML(command);

    text[] t = decendant_or_self(film/html/body, "b")/text();

    integer i;
    real rating = 0;
    for (i = 0; i < size(t); i++) {
      if ((string)t[i] == "User Rating:" && i != size(t)) {
        rating = ator(t[i + 1]);
        break;
      }
    }

    <li><a href=(url)>rating; " "; ./a/text();</a></li>

   __native__
     target.flush();
   __native__
  }
  </ol></body></html>
}
