program task550(input, output);
var inp, prevprev, prevsum, sum : integer;
begin
  writeln('Zvonov Andrey, 110 group, task 5.50');
  writeln('Enter your sequence: ');
  read(inp);
  sum := 0;
  prevprev := 0;
  prevsum := 0;
  while (inp>0) do begin
    sum := sum + (prevsum - prevprev);
    sum := sum + inp;
    prevprev := prevsum;
    prevsum := sum;
    read(inp);
  end;
  writeln('Here is your sum: ', sum);
end.
