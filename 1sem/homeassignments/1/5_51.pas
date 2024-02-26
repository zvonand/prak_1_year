program task551(input, output);
var
  beginng, ending, inp, k: integer;
  pal : boolean;
begin
  writeln('Andrey Zvonov, 110 group, task 5.51');
  writeln('Enter your number: ');
  read(inp);
  pal := true;
  k := 1;
  if inp mod 10 = 0 then pal := false;
  while (inp div k > 9) do begin
    k := k*10;
  end;
  while (k > 1) and pal do begin
    ending := inp mod 10;
    beginng := inp div k;
    inp := inp - k*beginng;
    inp := inp div 10;
    k := k div 100;
    if beginng <> ending then pal := false;
  end;
  writeln(pal);
end.
