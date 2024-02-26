program task633(input, output);
const
  move = 48;
var
  inp : char;
  num10, fives : integer;
begin
  writeln('Zvonov Andrey, 110 group, task 6.33');
  writeln('Enter your number: ');
  read(inp);
  num10 := 0;
  while inp <> ' ' do begin
    num10 := num10 * 8;
    num10 := num10 + ord(inp) - move;
    read(inp);
  end;
  fives := 1;
  while fives <= num10 do fives := fives * 5;
  fives := fives div 5;
  while fives > 0 do begin
    write(num10 div fives);
    num10 := num10 mod fives;
    fives := fives div 5;
  end;
end.
