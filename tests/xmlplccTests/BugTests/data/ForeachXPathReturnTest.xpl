integer main() {
  element e = <e test=""/>;

  foreach (e/@test) {
    return 1;
  }

  return 0;
}
