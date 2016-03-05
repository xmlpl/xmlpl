import xmlpl.string;

node[] main(document in, string[] args) {
 <table>
  integer numberpercolumn = atoi(args[1]);
  integer indx;

  element[] curr = in/searches/*;
  integer indx2;

  (: We are building a table of Search input boxes.
     The number of columns per row is passed in as a parameter. :)
  for (indx=0; indx< size(curr); indx=indx+numberpercolumn) {
	<tr>
	for (indx2 = 0; indx2 < numberpercolumn; indx2++) {
	  <td>
  	  if ((indx+indx2)< size(curr) && (curr[indx+indx2])) {
		<form class="search" method="get" action=(curr[indx+indx2]/@href) >
		<input type="text" size="40" name=(curr[indx+indx2]/@query) value="" />
		<input class="button" type="submit" value=(curr[indx+indx2]/@name) name=(curr[indx+indx2]/@submit) />
		</form>
	  }
	  </td>
	}
	</tr>
  }
  </table>

}