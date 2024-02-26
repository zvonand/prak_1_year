program task546(input, output);
var i, n, count, inp, previous : integer;
begin
  writeln('Zvonov Andrey, 110 group, task 5.46');
  writeln('Enter number of elements in sequence: ');
  read(n);
  writeln('Enter your sequence: ');
  read(previous);
  count := 1;
  for i := 2 to n do begin
    read(inp);
    if inp > previous then count := count + 1;
    previous := inp;
  end;
  writeln('There are ', count, ' different numbers in the sequence');
end.
