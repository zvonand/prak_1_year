{$R+,B+}
program task841v(input, output);
{insertion sort}
const
  N = 10;
var
  seq: array[1..N] of real;
  i, k: integer;
  temp: real;
  ready: boolean;
begin
  writeln('Zvonov Andrey, 110 group, task 8.41v');
  writeln('Enter your sequence: ');
  for i := 1 to N do read(seq[i]);
  for k := 2 to N do begin
    i := k - 1;
    ready := false;
    while not ready and (i > 0) do
      if seq[i] < seq[i + 1] then ready := true else begin
        temp := seq[i];
        seq[i] := seq[i + 1];
        seq[i + 1] := temp;
        i := i - 1;
      end;
  end;
  for i := 1 to N do write(seq[i]:0:2, ' ');
end.
