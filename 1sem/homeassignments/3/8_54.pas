{$R+,B+}
program task854(input, output);
const
  N = 10;
var
  inp1, inp2 : packed array[1..N] of integer;
  i, j, min : integer;
  found : boolean;
begin
  writeln('Zvonov Andrey, 110 group, task 8.54');
  writeln('Enter the first sequence: ');
  for i := 1 to N do read(inp1[i]);
  writeln('Enter the second sequence: ');
  for i := 1 to N do read(inp2[i]);
  min := MaxInt;
  for i := 1 to N do begin
    found := false;
    j := 1;
    while (j <= N) and not found do begin
      if inp1[i] = inp2[j] then found := true;
      j := j + 1;
    end;
    if found and (inp1[i] < min) then min := inp1[i];
  end;
  write(min);
end.
