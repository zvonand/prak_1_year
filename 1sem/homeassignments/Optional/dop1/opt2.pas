program opt2(input, output);
var
  inp, tens : integer;
begin
  writeln('Zvonov Andrey, 110 group, optional task 2');
  writeln('Enter the number: ');
  read(inp);
  tens := 1;
  while tens < inp do begin
    if (inp div tens) - (inp div (tens*10) *10) = 3 then inp := (inp div (tens*10))*tens + (inp mod tens);
    if tens*10 < inp then tens := tens*10 else tens := inp;
  end;
  writeln('Here is the result: ', inp);
end.
