program task634(input, output);
const
  move = 48;
var
  inp, prev : char;
  sum, ten : integer;
begin
  writeln('Zvonov Andrey, 110 group, task 6.34');
  writeln('Enter your sum: ');
  sum := 0;
  read(inp);
  prev := '+';
  while inp <> '.' do begin
    if prev = '+' then sum := sum + ord(inp) - move else
      if prev = '-' then sum := sum - ord(inp) + move;
    prev := inp;
    read(inp);
  end;
  {Symbolic output down here - as I understand, it is forbidden to output integers}
  ten := 1;
  if sum < 0 then begin
    write('-');
    sum := -1 * sum;
  end;
  while ten <= sum do ten := ten *10;
  ten := ten div 10;
  while (ten > 0) do begin
    write(chr(move + sum div ten));
    sum := sum mod ten;
    ten := ten div 10;
  end;
end.
