{$R+,B+}
program task841b(input, output);
{bubble sort}
const
  N = 10;
var
  seq: array[1..N] of real;
  i, j: integer;
  temp: real;
  sorted: boolean;
begin
  writeln('Zvonov Andrey, 110 group, task 8.41b');
  writeln('Enter your sequence: ');
  for i := 1 to N do read(seq[i]);
  sorted := false;
  j := 0;
  while not sorted do begin
    sorted := true;
    for i := 1 to (N - j -1) do
      if seq[i] > seq[i + 1] then begin
        temp := seq[i];
        seq[i] := seq[i + 1];
        seq[i + 1] := temp;
        sorted := false;
      end;
    j := j + 1;
  end;
  for i := 1 to N do write(seq[i]:0:2, ' ');
end.
