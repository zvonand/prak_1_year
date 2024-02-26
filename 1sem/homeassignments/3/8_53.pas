{$R+,B+}
program task853(input, output);
const
  N = 10;
var
  inp : packed array[1..2*N] of integer;
  i, j, max, max1, max2, curr : integer;
begin
  writeln('Zvonov Andrey, 110 group, task 8.53');
  writeln('Enter your numbers: ');
  max := 0;
  for i := 1 to N*2 do read(inp[i]);
  for i := 1 to (N - 1) do
    for j := (i + 1) to N do begin
        curr := sqr(inp[2*j] - inp[2*i]) + sqr(inp[2*j - 1] - inp[2*i - 1]);
        if curr > max then begin
          max := curr;
          max1 := i;
          max2 := j;
        end;
    end;
  write(max1, ' and ', max2);
end.
