program task632(input, output);
const
  move = 48;
var inp : char;
    max, curr, ten : integer;
begin
  writeln('Zvonov Andrey, 110 group, task 6.32');
  writeln('Enter sequence');
  read(inp);
  max := 0;
  while inp <> '.' do begin
    curr := 0;
    while (inp <> ' ') and (inp <> '.') do begin
      curr := curr*7 + ord(inp) - 48;
      read(inp);
    end;
    if inp <> '.' then read(inp);
    if curr > max then max := curr;
    curr := 0;
  end;
  {Symbolic output down here - as I understand, it is forbidden to output integers}
  ten := 1;
  while ten <= max do ten := ten *10;
  ten := ten div 10;
  while (ten > 0) do begin
    write(chr(move + max div ten));
    max := max mod ten;
    ten := ten div 10;
  end;
end.
