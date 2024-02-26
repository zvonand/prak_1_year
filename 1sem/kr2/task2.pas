program task2(input, output);
const
  movelow = 97;
  movehigh = 65;
var
  inp : char;
  high: array['A'..'Z'] of 0..MaxInt;
  low: array['a'..'z'] of 0..MaxInt;
  diff: integer;
begin
  diff:= movelow - movehigh;
  for inp := 'A' to 'Z' do high[inp] := 0;
  for inp := 'a' to 'z' do low[inp] := 0;
  read(inp);
  while inp <> '.' do begin
    if ord(inp) >= movelow then low[inp] := low[inp] + 1 else
      if ord(inp) >= movehigh then high[inp] := high[inp] + 1;
    read(inp);
  end;
  for inp := 'a' to 'z' do
    if (low[inp] < high[chr(ord(inp)-diff)]) and (low[inp] <> 0) then write(inp, ' ');
end.
