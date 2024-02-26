{$R+,B+}
program task841g(input, output);
{binary insertion sort}
const
  N = 10;
var
  seq: array[1..N] of real;
  i, k, lower, higher, curr: integer;
  temp : real;
begin
  writeln('Zvonov Andrey, 110 group, task 8.41v');
  writeln('Enter your sequence: ');
  for i := 1 to N do read(seq[i]);
  for i := 1 to N do begin
    temp := seq[i];
    lower := 1;
    higher := i;
    k:=i;
    while (lower < higher) do begin
      curr := (lower + higher) div 2;
      if (temp <= seq[curr]) then
        higher := curr
      else
        lower := curr + 1;
    end;
    while (k > higher) do begin
      seq[k] := seq[k - 1];
      k := k - 1;
    end;
    seq[higher] := temp;
  end;
  for i := 1 to N do write(seq[i]:0:2, ' ');
end.
