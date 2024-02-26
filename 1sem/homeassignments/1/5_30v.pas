program task530v(input, output);
var i, inp1, inp2, diff, n : integer;
  arith : boolean;
begin
  writeln('Zvonov Andrey, 110 group, task 5.30v');
  writeln('Input number of numbers: ');
  read(n);
  read(inp1, inp2);
  arith := true;
  diff := inp2 - inp1;
  i := 3;
  while (i <= n) and arith do begin
    inp2 := inp2 + inp1;
    inp1 := inp2 - inp1;
    inp2 := inp2 - inp1;
    read(inp2);
    if inp2 - inp1 <> diff then arith := false;
    i := i+1;
  end;
  if arith then writeln('Yes') else writeln('No');
end.
