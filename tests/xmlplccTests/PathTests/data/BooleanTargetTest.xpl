node[] main(document in) {
  if (in/root/child[@id == "2"]) "true\n";
  else "false\n";

  if (in/root/child[@id == "200"]) "true\n";
  else "false\n";
}
