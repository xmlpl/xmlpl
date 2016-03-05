node[] main(document in) {
  <results> "\n";
    <girls> "\n";
      foreach (in/people/person)
        if (./@sex == "female") {
          <name>(string)./@name;</name> "\n";
        }
    </girls> "\n";
    <boys> "\n";
      foreach (in/people/person)
        if (./@sex == "male") {
	  <name>(string)./@name;</name> "\n";
	}
    </boys> "\n";
  </results> "\n";
}
