program opt4(input, output);
var
  n, i, y : integer;
  repr : boolean;
begin
  writeln('Zvonov Andrey, group 110, optional task 4');
  writeln('Enter your number: ');
  read(n);
  i := 1;
  y := 1;
  repr := false;
  while (sqr(i) < n) and not repr do begin
    y := 1;
    while (sqr(y) < n) and not repr do begin
      if sqr(i) + sqr(y) = n then repr := true;
      if not repr then y := y + 1;
    end;
    if not repr then i := i + 1;
  end;
  if repr then writeln(n, ' = ', sqr(i), ' + ', sqr(y)) else writeln('Cannot be represented as two squares');
end.
