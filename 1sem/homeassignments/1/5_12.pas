program task512(input, output);
var x : real;
  i : integer;
begin
  writeln('Zvonov Andrey, 110 group, task 5.12');
  writeln('   x   ', 'sin(x) ', 'cos(x)');
  for i := 0 to 10 do begin
    x := i / 10;
    writeln(x:6:4, sin(x):7:4, cos(x):7:4);
  end;
end.
