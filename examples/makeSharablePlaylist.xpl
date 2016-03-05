import xmlpl.stdio;
import xmlpl.xml;
import xmlpl.string;

string[] extensions = "mp3", "mpc", "wma", "wav", "flac", "rm", "ogg", "aac";

string[] main(string[] args) {
 <playlist version="1" xmlns="http://xspf.org/ns/0/"> 
   if (size(args) > 1) <title>args[1];</title>

   <trackList>
     while (1) {
       string line;

       __native__
       char *line = 0;
       size_t n = 0;
       if (getline(&line, &n, stdin) == -1) break;
       XPL_line = line;
       __native__

       string file = right(line, -1);

       boolean match = false;
       foreach (extensions) {
         string ext = "." + .;
         if (ext == right(file, length(ext))) {
           match = true;
           break;
         }
       }
       if (!match) continue;

       <track><location>
         "file://"; file;
       </location></track>
     }
   </trackList>
 </playlist>
}
