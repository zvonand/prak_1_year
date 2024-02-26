{$R+,B+}
program tsk914bv(input, output);
const
  N = 10;
var
  B, V: array[1..N, 1..N] of integer;
  i, y: integer;
begin
  writeln('Zvonov Andrey, 110 group, task 9.14 b, v');
  for i := 0 to (N - 1) do
    for y := 1 to N do B[(i + 1), y] := i * 10 + y;

    for i := 1 to 10 do
      for y := 0 to 9 do begin
        if i + y <= 10 then V[i, y + i] := y + 1;
      end;

  for i := 1 to N do begin
    for y := 1 to N do write(B[i, y] : 4);
    writeln();
  end;
  writeln();
  for i := 1 to N do begin
    for y := 1 to N do write(V[i, y] : 3);
    writeln();
  end;
end.
