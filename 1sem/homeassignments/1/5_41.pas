program task541(input, output);
var inp1, inp2, count : integer;
begin
  writeln('Zvonov Andrey, 110 group, task 5.41');
  count := 0;
  writeln('Now you are to enter a sequence of numbers you want to check:');
  read(inp1, inp2);
  while (inp2 <> 0) do begin
    if inp1*inp2 < 0 then count := count+1;
    inp2 := inp2+inp1;
    inp1 := inp2-inp1;
    inp2 := inp2-inp1;
    read(inp2);
  end;
  writeln('This sequence changed sign ', count, ' times');
end.
