simport xmlpl.xml;
import xmlpl.string;
import xmlpl.stdio;
import xmlpl.process;

string basename(string name) {
  string[] parts = tokenize(name, "/");
  return parts[size(parts) - 1];
}

integer random() {
  __native__
  return random();
  __native__
}

void seed() {
  __native__
  srandom(time(0));
  __native__
}

integer cols = 5;
integer twidth = 107;
integer theight = 80;
integer mwidth = 800;
integer mheight = 600;
string title;
string home;

integer count = 0;
integer total = 0;

void createScaled(string original, string scaled, integer width,
                  integer height) {
 if (!exists(scaled)) {
    string command = "convert " + original + " -auto-orient -scale " + width +
      "x" + height + " " + scaled + " 2>/dev/null";

    print(command + "\n");
    system(command);
 }
}

node[] doImagePage(element image, boolean slide) {
  string fullname = value(image/@file);
  string name = basename(fullname);
  string medium = "medium/" + name;
  string exif = "exif" + count + ".html";

  <html>
    <head>
      if (slide) {
        string url = "slide";
        if (count == total - 1) url += "0.html";
        else url = url + (count + 1) + ".html";

        <meta http-equiv="Refresh" content=("5; URL=" + url)/>
      }

      if (image/comment)
        <title>
          title + " - ";
          image/comment/text();
        </title>
    </head>
    <body text="orange" bgcolor="black" link="orange" vlink="orange">
      <center>
        <table cellspacing="5"><tr>

          if (slide) {
            <td><a href=("image" + count + ".html")>"Stop";</a></td>
            <td><a href="index.html" target="_top">"Index";</a></td>
            if (home != "") <td><a href=(home) target="_top">"Home";</a></td>

          } else {
            <td>
              if (count)
                <a href=("image" + (count - 1) + ".html")>"<-- Previous";</a>
              else "<-- Previous";
            </td>
 
            <td><a href="index.html" target="_top">" Index ";</a></td>
            if (home != "") <td><a href=(home) target="_top">"Home";</a></td>
            if (image/exif)
              <td><a href=(exif)>"Info";</a></td>
            <td><a href=("slide" + count + ".html")>"Slide Show";</a></td>
           
            <td>
              if (count + 1 < total)
                <a href=("image" + (count + 1) + ".html")>"Next -->";</a>
              else "Next -->";
            </td>
          }
        </tr></table>

        <img height="85%" border="1" src=(medium)/>
        <br/>
        <br/>

        if (image/comment) {
          image/comment/text();
        }

        string date = image/exif/Date_and_Time/text();
        if (date && date != "0000:00:00 00:00:00") {
          if (image/comment) " - ";
          date;
        }

      </center>
    </body>
  </head>
}

node[] doImage(element image) {
  string fullname = value(image/@file);
  string name = basename(fullname);
  string thumb = "thumbs/" + name;
  string medium = "medium/" + name;
  string html = "image" + count + ".html";
  string slide = "slide" + count + ".html";
  string exif = "exif" + count + ".html";

  createScaled(fullname, medium, mwidth, mheight);
  createScaled(medium, thumb, twidth, theight);

  <a href=(html)>
    <img src=(thumb)/>
  </a>

  node<< stream = openNodeStream(html);
  redirect (stream) doImagePage(image, false);
  close(stream);

  stream = openNodeStream(slide);
  redirect (stream) doImagePage(image, true);
  close(stream);

  stream = openNodeStream(exif);
  redirect (stream) {
    <html>
      <head>
      </head>
      <body text="orange" bgcolor="black" link="orange" vlink="orange">
        <center>
          <table><tr>
            <td>
              if (count)
                <a href=("exif" + (count - 1) + ".html")>"<-- Previous";</a>
              else "<-- Previous";
            </td>
 
            <td><a href="index.html" target="_top">" Index ";</a></td>
            <td><a href=(html)>"Image";</a></td>
           
            <td>
              if (count + 1 < total)
                <a href=("exif" + (count + 1) + ".html")>"Next -->";</a>
              else "Next -->";
            </td>
          </tr></table>
 
          <table border="1">
          <tr>
            integer i;
            for (i = 0; i < 2; i++) {
              <th>"Tag";</th><th>"Value";</th>
            }
          </tr>

          element[] tags = image/exif/*; :: */
          integer i = 0;

          while (i < size(tags)) {
            <tr>
              while (i < size(tags)) {
                <td>xmlpl.xml.name(tags[i]);</td>
                <td>tags[i]/text();</td>
                i++;
                if (i >= size(tags) || i % 2 == 0) break;
              }
            </tr>
          }
          </table>

          <br/>fullname;<br/>

        </center>
      </body>
    </head>
  }
  close(stream);

  count++;
}

node[] indexPage(element[] images) {
 <html>
    <head>
      if (title != "") <title>title;</title>
    </head>
    <body text="orange" bgcolor="black" link="orange" vlink="orange">
      <center>

        if (title != "") <h1>title;</h1>

        <table>
          if (home != "")
            <tr><td align="center" colspan="2"><a href=(home)>"Home";</a></td></tr>
          <tr>
            <td><a href="slide0.html">"Slide Show";</a></td>
            <td><a href="frames.html">"Frame Index";</a></td>
          </tr>
        </table>
        <br/>

        <table>
          integer i = 0;
          while (i < total) {
            <tr>
              while (i < total) {
                <td align="center">
                  doImage(images[i]);
                </td>

                i++;
                if (i % cols == 0) break;
              }
            </tr>
          }
        </table>

      </center>
    </body>
  </html>
}

node[] framesPage() {
  <html>
    <head>
      <frameset rows=("*," + (theight + 50))>
        <frame name="main" src="image0.html"/>
        <frame name="thumbs" src="thumbs.html"/>
      </frameset>
      <noframes>
       <h1>"Your web browser does not support frames.";</h1>
 
        "You should update your web browser to one from this age!";
        <a href="http://www.mozilla.org/products/firefox/">"Mozilla Firefox";</a>
        "is an excellent and FREE web browser.";
      </noframes>
    </head>
  </html>
}

node[] thumbsPage(element[] images) {
  <html>
  <head></head>
  <body text="orange" bgcolor="black" link="orange" vlink="orange">

    <center><table cellspacing="5"><tr>

      integer i;
      for (i = 0; i < size(images); i++) {

        <td>
          <a href=("image" + i + ".html") target="main">
            <img border="1" src=("thumbs/" + basename(images[i]/@file))/>
          </a>
        </td>
      }
    </tr></table></center>

  </body>
  </html>
}

node[] doCollection(element collection) {
  title = value(collection/@title);
  count = 0;
  total = size(collection/image);


  if (!exists("medium")) system("mkdir medium");
  if (!exists("thumbs")) system("mkdir thumbs");

  node<< stream = openNodeStream("index.html");
  redirect (stream) indexPage(collection/image);
  close(stream);

  stream = openNodeStream("frames.html");
  redirect (stream) framesPage();
  close(stream);

  stream = openNodeStream("thumbs.html");
  redirect (stream) thumbsPage(collection/image);
  close(stream);
}

node[] doCollections(element collections) {
  node<< stream = openNodeStream("index.html");
  redirect (stream) {
    <html>
      <head></head>
      <body text="orange" bgcolor="black" link="orange" vlink="orange">

        <center>
          <br/><br/>
          <table>
            foreach (collections/collection) {
              string href=(string)@name + "/frames.html";

              <tr>
                integer idx = random() % size(./image);
                string thumb = value(@name) + "/thumbs/" + basename(./image[idx]/@file);
                <td align="center"><a href=(href)><img src=(thumb)/></a></td>
                <td align="center" valign="center">
                  <a href=(href)>(string)@title; " ("; size(./image); ")";</a>
                  <br/>
                  <table><tr>
                    <td><a href=((string)@name + "/index.html")>"index";</a></td>
                    <td><a href=((string)@name + "/slide0.html")>"slide show";</a></td>
                  </tr></table>
                </td>
              </tr>
            }
          </table>
        </center>

      </body>
    </html>
 }
 close(stream);

 if (home == "") home = "../index.html";

 foreach (collections/collection) {
   if (!exists(@name)) system("mkdir " + (string)@name);

   if (chdir(@name)) {
     doCollection(.);

     (void)chdir("..");
   }
 }
}

node[] main(document in, string[] args) {
  element x = in/*; :: */

  if (size(args) > 1) home = args[1];

  seed();

  switch ((string)name(x)) {
  case "collection": doCollection(x); break;
  case "collections": doCollections(x); break;
  }
}
