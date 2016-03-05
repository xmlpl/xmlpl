import xmlpl.string;
import xmlpl.stdio;
import xmlpl.stdlib;
import xmlpl.xml;
import xmlpl.process;
import xmlpl.curl;

string base = "http://www.mininova.org";


string[] sorts =
  "Name", "name",
  "Size", "size",
  "Seeds", "seeds",
  "Leech", "leech",
  "Date", "added";

string[] cats =
  "All",
  "Anime",
  "Books",
  "Games",
  "Movies",
  "Music",
  "Pics",
  "Appz",
  "TV",
  "Other";

boolean allowPrivate = false;
integer minSeeds = 1;

string getQValue(string[] query, string name) {
  integer i;
  for (i = 0; i + 1 < size(query); i += 2)
    if (name == query[i]) return url_unescape(query[i + 1]);

  return "";
}

node[] evenOdd(boolean even) {
  if (even) Attribute("class", "even");
  else Attribute("class", "odd");
}

node[] doTorrent(element tr, boolean withCat, boolean even) {
  element[] td = tr/td;

  integer i = 0;

  string date = concat(td[i]/text()); i++;

  if (withCat) i++;

  integer id = atoi(left(td[i]/a[./img[@alt == "[D]"]]/@href, -5));
  boolean private = td[i]/a[./img[@alt == "[P]"]];

  if (private && !allowPrivate) return;

  string name = concat(td[i]/a[size(td[i]/a) - 1]/text()); i++;
  string size = concat(td[i]/text()); i++;
  integer seeds = atoi(concat(td[i]/div/text())); i++;
  integer leechers = atoi(concat(td[i]/div/text()));

  if (seeds < minSeeds) return;

  <tr>
    if (!seeds || private) Attribute("class", "redflag");

    <td>evenOdd(!even);
      <a target="frame" href=("?cmd=load&id=" + id)>"Get";</a>
    </td>
    <td>evenOdd(even);
      <a target="frame" href=("?cmd=tor&id=" + id)>"Info";</a>
    </td>
    <td>evenOdd(!even);
      <a target="frame" href=("?cmd=com&id=" + id)>"Com";</a>
    </td>
    <td>evenOdd(even);
      <a target="frame" href=("?cmd=det&id=" + id)>"Det";</a>
    </td>

    <td>evenOdd(even);
      <a target="frame" href=(base + "/get/" + id)>
        name;
      </a>
    </td>

    <td>evenOdd(!even); size;</td>
    <td>evenOdd(even); seeds;</td>
    <td>evenOdd(!even); leechers;</td>
    <td>evenOdd(even); date;</td>
  </tr>
}

node[] doSearch(string search, string sort, integer cat) {
  "Content-type: text/html\n\n";

  <html>
    <head>
      <style type="text/css">
        "table {font-size:10pt;border:1px solid black;margin:0px}";
        ".table {width:100%;height:50%;margin-top:-10px;overflow:auto}";
        ".frame {width:100%;height:45%}";
        ".frame {top:50px}";
        ".even {background-color:#eeeee6}";
        "td, th {border-top:1px solid black;border-left:1px solid black;white-space:nowrap}";
        "a {text-decoration:none}";
        ".redflag td, .redflag a {color:red}";
      </style>
    </head>
    <body>
      <form method="get">
       <select name="cat">
         integer i = 0;

         foreach (cats)
           <option value=(i)>
             if (i == cat) Attribute("selected", "true");
             .;
             i++;
           </option>
       </select>

       <select name="sort">
         integer i;

         for (i = 0; i < size(sorts); i += 2)
           <option value=(sorts[i + 1])>
             if (sorts[i + 1] == sort) Attribute("selected", "true");
             sorts[i];
           </option>
       </select>

       <input name="search" value=(search) size="40" type="text"/>
       <input class="button" value="Search Mininova" type="submit"/>
       "Show private:";
       <input type="checkbox" name="private">
         if (allowPrivate) Attribute("checked", "true");
       </input>
       "Min Seeds:";
       <input type="text" size="10" value=(minSeeds) name="minseeds"/>
     </form>

     string query = "search=" + search + "&cat=" + cat + "&sort=";

     <div class="table"><table>
       <tr>
         <th colspan="4">"Commands";</th>

         integer i;
         for (i = 0; i < size(sorts); i += 2) {
           <th>
             <a href=("?" + query + sorts[i + 1])>sorts[i];</a>
           </th>
         }
       </tr>

     string url = base + "/search/?" + query + sort;

     boolean even = false;
     foreach (open(url)/html/body/div/table[@class == "maintable"]/tr[./td])
       doTorrent(., cat == 0, even = !even);

     </table></div>

     <iframe class="frame" name="frame"/>
    </body>
  </html>
}

node[] doLoad(string id) {
  (void)system("azureusOpen " + base + "/get/" + id);
}

node[] doTorPart(string id, string part) {
  "Content-type: text/html\n\n";

  <html>
    <head>
      <link rel="stylesheet" href=(base + "/css/main-v6.css") type="text/css"/>
    </head>
    <body>
      string url = base + "/" + part + "/" + id;
	open(url)/html/body/div[@id == "main"]/* ::*/
        [name(.) == "h1" || (name(.) == "table" && @class == "infotable") ||
         (name(.) == "div" && left(@class, 8) == "comment_")];
    </body>
  </html>
}

node[] main(string[] args) {
  string[] query = tokenize(getenv("QUERY_STRING"), "&=");
  string cmd = getQValue(query, "cmd");

  switch (cmd) {
  case "load":
    doLoad(getQValue(query, "id"));

  case "tor":
  case "com":
  case "det":
    doTorPart(getQValue(query, "id"), cmd);
    break;

  default:
    allowPrivate = getQValue(query, "private") != "";
    if (getQValue(query, "minseeds") != "")
      minSeeds = atoi(getQValue(query, "minseeds"));

    doSearch(getQValue(query, "search"), getQValue(query, "sort"),
      atoi(getQValue(query, "cat")));
  }
}
