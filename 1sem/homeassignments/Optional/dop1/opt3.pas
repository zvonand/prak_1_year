program opt_3(input, output);
var
  inp, max, tens : integer;
begin
  writeln('Zvonov Andrey, 110 group, optional task 3');
  writeln('Enter your number: ');
  read(inp);
  tens := 1;
  max := 0;
  while tens < inp do begin
    if (inp div (tens*10))*tens + (inp mod tens) > max then max := (inp div (tens*10))*tens + (inp mod tens);
    if tens*10 < inp then tens := tens * 10 else tens := inp;
  end;
  writeln('The maximum is ', max);
end.
