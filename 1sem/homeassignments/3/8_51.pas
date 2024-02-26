{$R+,B+}
program task851(input, output);
const
  N = 10;
var
  inp : packed array[1..N] of integer;
  i, maxind, minind, sum : integer;
begin
  writeln('Zvonov Andrey, 110 group, task 8.51');
  writeln('Enter your numbers');
  for i := 1 to N do read(inp[i]);
  maxind := 1;
  minind := 1;
  sum := 0;
  for i := 1 to N do begin
    if inp[i] > inp[maxind] then maxind := i;
    if inp[i] < inp[minind] then minind := i;
  end;
  if maxind > minind then
    for i := minind to maxind do sum := sum + inp[i] else
      for i := maxind to minind do sum := sum + inp[i];
  write('The required sum is ', sum);
end.
