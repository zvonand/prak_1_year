program task542(input, output);
var i, n, inpx, inpy : integer;
  maxrad : real;
begin
  writeln('Zvonov Andrey, 110 group, task 5.42');
  writeln('Enter number of pairs: ');
  read(n);
  maxrad := 0;
  for i := 1 to n do begin
    write('Enter point coordinates: ');
    read(inpx, inpy);
    if (inpx*inpx + inpy*inpy) > maxrad*maxrad then maxrad := sqrt(inpx*inpx + inpy*inpy);
  end;
  writeln('The required radius is ', maxrad : 1 : 4);
end.
