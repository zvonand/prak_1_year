program task539(input, output);
var
  a, b, c : boolean;
begin
  writeln('Zvonov Andrey, 110 group, task 5.39');
  writeln('------------------------');
  writeln('  A     B     C     F   ');
  writeln('------------------------');
  for a := true downto false do
    for b := true downto false do
      for c := true downto false do begin
        writeln(a:6, b:6, c:6, ((a and b) or not (b or c)):6);
      end;
  writeln('------------------------');
end.
