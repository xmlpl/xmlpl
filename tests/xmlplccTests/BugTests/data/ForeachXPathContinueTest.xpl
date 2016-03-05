integer main() {
  element e = <e test=""/>;

  foreach (e/@test) {
    if (. == "") continue;
    return 1;
  }

  return 0;
}
