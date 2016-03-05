import xmlpl.xml;
import xmlpl.stdio;
import xmlpl.string;
import xmlpl.process;

integer getBase(integer id) {
  return id / 100;
}

string traceURL(integer id) {
  return "traces/trace" + getBase(id) + ".html#trace" + id;
}

node[] doTrace(string[] lines, integer &i) {
  integer id = atoi(left(lines[i], -6));
  integer base = getBase(id);

  node<< stream = openNodeStream("traces/trace" + base + ".html");

  redirect(stream) <html><body>
    for (; left(lines[i], 5) == "TRACE" && base == getBase(id); i++) {
      id = atoi(left(lines[i], -6));

      <h3><a name=("trace" + id)>lines[i];</a></h3>
      <ul>
        for (i++; left(lines[i], 1) == "\t"; i++)
          <li>lines[i];</li>
      </ul>
      <br/>

      i -= 1;
    }
  </body></html>

  close(stream);

  i -= 1;
}

node[] doSites(string[] lines, integer &i) {
  <html><body>
  <table border="1">
    <tr>
      <th>"rank";</th>
      <th>"% self";</th><th>"% accum";</th>
      <th>"live bytes";</th><th>"live objs";</th>
      <th>"alloc'ed bytes";</th><th>"alloc'ed objs";</th>
      <th>"trace";</th><th>"class";</th>
    </tr>

    for (i += 3; left(lines[i], 9) != "SITES END"; i++) {
      string[] fields = tokenize(lines[i], " \t");

      <tr>
        integer j;
        for (j = 0; j < 7; j++) <td>fields[j];</td>
        <td><a href=(traceURL(atoi(fields[7]))) target="traces">
          fields[7];
        </a></td>
        <td>fields[8];</td>
      </tr>
    }
  </table>

  </body></html>
}

string[] toStrings(element[] s) {
  foreach(s) concat(./text(), "");
}

integer main(document in) {
  node<< sites = openNodeStream("sites.html");
  node<< index = openNodeStream("index.html");

  redirect(index) <html><head>
    <frameset rows="70%,*">
      <frame name="sites" src="sites.html"/>
      <frame name="traces" src=""/>
    </frameset>
  </head></html>
  close(index);

  if (!exists("traces")) system("mkdir traces");

  string[] lines = toStrings(in/lines/l);
  integer i;

  boolean start = false;

  for (i = 0; i < size(lines); i++) {
    if (!start) {
      if (left(lines[i], 8) == "--------") start = true;
      continue;
    }

    if (left(lines[i], 5) == "TRACE") {
      doTrace(lines, i);
      continue;
    }

    if (left(lines[i], 11) == "SITES BEGIN") {
      redirect(sites) doSites(lines, i);
      continue;
    }
  }

  close(sites);
  return 0;
}
