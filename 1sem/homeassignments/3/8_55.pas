{$R+,B+}
program task855(input, output);
const
  N = 10;
var
  inp : packed array[1..N] of integer;
  i, j, count : integer;
begin
  writeln('Zvonov Andrey, group 110, task 8.55');
  count := 0;
  writeln('Enter your sequence: ');
  for i := 1 to N do read(inp[i]);
  for i := 1 to (N - 1) do
    for j:= i + 1 to N do
      if inp[i] > inp[j] then count := count + 1;
  write(count, ' inversions');
end.
