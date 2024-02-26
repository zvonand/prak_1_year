{$R+,B+}
program task858(input, output);
const
  N = 10;
var
  seq : packed array[1..N] of char;
  inp : char;
  i, current : integer;
  first : boolean;
begin
  writeln('Zvonov Andrey, 110 group, task 8.58');
  writeln('Enter your sequence: ');
  read(inp);
  current := 0;
  while (inp <> '.') and (current < N) do begin
    i := 1;
    first := true;
    while(i <= current) do begin
      if inp = seq[i] then first := false;
      i := i + 1;
    end;
    if first then begin
      current := current + 1;
      seq[current] := inp;
    end;
    read(inp);
  end;
  writeln(current);
end.
