program task57d(input, output);
var
  max, count, inp : integer;
begin
  writeln('Zvonov Andrey, 110 group, task 5.7d');
  writeln('Enter your numbers: ');
  read(inp);
  max := -1;
  while inp <> 0 do begin
    if inp > max then begin
      max := inp;
      count := 1;
    end else if inp = max then count := count + 1;
    read(inp);
  end;
  writeln(count);
end.
