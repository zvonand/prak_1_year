program task626v(input, output);
var
  inp, beg, ending, prev : char;
  count : integer;
begin
  writeln('Zvonov Andrey, 110 group, task 6.26v');
  writeln('Enter your sequence: ');
  read(inp);
  beg := inp;
  count := 0;
  prev := ',';
  while inp <> '.' do begin
    beg := inp;
    while (inp <> ',') and (inp <> '.') do begin
      prev := inp;
      read(inp);
    end;
    if beg = prev then count := count + 1;
    if(inp <> '.') then read(inp);
  end;
  writeln(count, ' such words');
end.
