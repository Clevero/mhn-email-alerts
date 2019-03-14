cat head.html
echo "<table class='table table-bordered' border='1'>" ;
print_header=true
while read INPUT ; do
  if $print_header;then
    echo "<tr><th>${INPUT//,/</th><th>}</th></tr>" ;
    print_header=false
  else
    echo "<tr><td>${INPUT//,/</td><td>}</td></tr>" ;
  fi
done < /tmp/mhn-report.txt ;
echo "</table>"
cat foot.html
