program task631(input, output);
const
  move = 48;
var
  n, i, z, three : integer;
begin
  writeln('Zvonov Andrey, 110 group, task 6.31');
  writeln('Enter n: ');
  read(n);
  for i := 0 to n do begin
    z := i;
    three := 1;
    if z = 0 then write(chr(move));
    while (three <= z) do begin
      three := three * 3;
    end;
    three := three div 3;
    while three > 0 do begin
      write(chr(move + (z div three)));
      z := z mod three;
      three := three div 3;
    end;
    write(' ');
  end;
end.
