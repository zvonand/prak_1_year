{$R+,B+}
program task829j(input, output);
const
  N = 10;
var
  arr : array[1..N] of integer;
  i, j : integer;
begin
  writeln('Zvonov Andrey, 110 group, task 8.29j');
  writeln('Enter the array: ');
  j := 1;
  for i := 1 to N do read(arr[i]);
  for i := 1 to N do
    if (arr[i] <> 0) then begin
      arr[j] := arr[i];
      j := j + 1;
    end;
  for i := j to N do arr[i] := 0;
  for i := 1 to N do write(arr[i], ' ');
end.
