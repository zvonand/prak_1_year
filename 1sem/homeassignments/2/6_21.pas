program task621(iput, output);
var
  inp, prev, prevprev : char;
  count : integer;
begin
  count := 0;
  writeln('Zvonov Andrey, 110 group, task 6.21');
  writeln('Enter your sequence');
  read(inp);
  prev := 'n';
  prevprev := 'n';
  while inp <> '.' do begin
    if ((prevprev = 'a') and (prev = 'b')) and (inp = 'c') then count := count + 1;
    prevprev := prev;
    prev := inp;
    read(inp);
  end;
  writeln(count, ' times');
end.
