import xmlpl.dirent;
import xmlpl.stdio;
import xmlpl.string;
import xmlpl.gen;
import xmlpl.unistd;


string[] extensions = (
  ".mp3", ".wma", ".ogg", ".aac", ".m4a", ".mp4", ".mpc", ".mid", ".wav",
  ".aif", ".aiff", ".flac", ".au", ".midi", ".mp2", ".mp1", ".mpa", ".sid",
  ".snd", ".ra", ".ram"
);


node[] playlistDir(string path) {
  foreach (readdir(path)/entry) {
    string name = @name;
    if (name == "." || name == "..") continue;

    switch (@type) {
    case "file": {
      string ext;

      if (left(right(name, 3), 1) == ".") ext = downcase(right(name, 3));
      else if (left(right(name, 4), 1) == ".") ext = downcase(right(name, 4));
      else if (left(right(name, 5), 1) == ".") ext = downcase(right(name, 5));

      if (extensions[. == ext]) {
        "    ";
        <location>"file://" + path + "/" + name;</location>
        "\n";
      }
      break;
    }

    case "dir":
      playlistDir(path + "/" + name);
      break;
    }
  }
}


node[] main(document in, string[] args) {
  string[] playlists;
  string cwd = getcwd();

  <rhythmdb-playlists>
    "\n";

    :: non-static first
    foreach (in/rhythmdb-playlists/playlist[@type != "static"]) {
      "  "; .; "\n";
    }

    integer count = 0;
    foreach (args) {
      if (!count++) continue; :: Skip first arg

      string path = .;
      string name = join(tokenize(basename(path), "-_"), " ");

      if (left(path, 1) != "/") path = cwd + "/" + path;

      "  ";
      <playlist name=(name) type="static">
        "\n";
        playlistDir(path);
        "  ";
      </playlist>
      "\n";

      playlists ,= name;
    }

    :: static
    foreach (in/rhythmdb-playlists/playlist[@type == "static"]) {
      string name = @name;
      if (!playlists[. == name]) {"  "; .; "\n";}
    }
  </rhythmdb-playlists>
}
