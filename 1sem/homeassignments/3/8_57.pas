{$R+,B+}
program task857(input, output);
const
  N = 10;
var
  seq : packed array[1..N] of char;
  j, i, current : integer;
  inp : char;
  first : boolean;
begin
  writeln('Zvonov Andrey, 110 group, task 8.57');
  writeln('Enter your sequence:');
  current := 0;
  for i := 1 to N do begin
    read(inp);
    first := true;
    j := 1;
    while j <= current do begin
      if inp = seq[j] then first := false;
      j := j + 1;
    end;
    if first then begin
      current := current + 1;
      seq[current] := inp;
    end;
  end;
  for i := 1 to current do write(seq[i]);
end.
