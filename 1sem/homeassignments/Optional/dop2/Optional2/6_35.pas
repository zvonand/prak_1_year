program task635(input, output);
const
  move = 48;
var
  inp, prev: char;
  sum, ten, curr: integer;
  positive: boolean;
begin
  writeln('Zvonov Andrey, 110 group, task 6.34');
  writeln('Enter your sum: ');
  sum := 0;
  read(inp);
  prev := '+';
  curr := 0;
  while inp <> '.' do begin
    if (inp = '+') or (inp = '-') then begin
      sum := sum + curr;
      curr := 0;
    end;
    if prev = '+' then positive := true else if prev = '-' then positive := false;
    if positive and (inp <> '+') and (inp <> '-') then curr := curr*10 - move + ord(inp) else
      if not positive and (inp <> '+') and (inp <> '-') then
        curr := curr * 10 + move - ord(inp);
    prev := inp;
    read(inp);
  end;
  sum := sum + curr;
  {Symbolic output down here - as I understand, it is forbidden to output integers}
  ten := 10000;
  if sum < 0 then begin
    write('-');
    sum := -1 * sum;
  end;
  while ten > sum do ten := ten div 10;
  while (ten > 0) do begin
    write(chr(move + sum div ten));
    sum := sum mod ten;
    ten := ten div 10;
  end;
end.
