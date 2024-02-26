program task554(input, output);
var
  n, i, y : integer;
    prime : boolean;
begin
  writeln('Zvonov Andrey, group 110, task 5.54');
  writeln('Enter your number: ');
  read(n);
  write('2, ');
  for i := 3 to n do begin
    prime := true;
    y := 2;
    while prime and (sqr(y) <= i) do begin
      if (i mod y) = 0 then prime := false;
      y := y + 1;
    end;
    if prime then write(i, ', ');
  end;
end.
