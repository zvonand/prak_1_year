program task548(input, output);
var
  i, n, inp, count, max : integer;
begin
  writeln('Zvonov Andrey, 110 group, task 5.48');
    count := 0;
    max := 0;
    writeln('Enter number of elements: ');
    read(n);
    writeln('Enter your sequence: ');
    for i := 1 to n do begin
      read(inp);
      if inp <> 0 then count := 0;
      if inp = 0 then count := count+1;
      if count > max then max := count;
    end;
    writeln('There are ', max, ' zeros in the longest sequence');
end.
