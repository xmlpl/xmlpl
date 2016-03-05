node[] main(document in) {
  attribute a = in/root/child/@id;

  if (a == "Hello World!") {
    "@id == \""; a; "\"\n";
  }

  if (a != "test") {
    "@id != \"test\"\n";
  }
}
