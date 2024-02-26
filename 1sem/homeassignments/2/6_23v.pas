program task623v(input, output);
var inp, prev : char;
begin
  writeln('Zvonov Andrey, 110 group, task 6.23v');
  writeln('Enter your sequence: ');
  inp := 'v';
  while inp <> '.' do begin
    prev := inp;
    read(inp);
    if not((prev = 'c') and (inp = 'b') or (inp = '.')) then write(inp);
  end;
end.
