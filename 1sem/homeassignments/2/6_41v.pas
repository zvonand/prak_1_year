program task641v(input, output);
const
  move = 48;
var
  inp : char;
  last, sum : integer;
begin
  writeln('Andrey Zvonov, 110 group, task 6.41v');
  writeln('Enter your number: ');
  read(inp);
  last := 0;
  sum := 0;
  while (inp >= '0') and (inp <= '9')  do begin
    sum := sum + ord(inp) - move;
    sum := sum mod 3;
    last := ord(inp) - move;
    read(inp);
  end;
  if inp <> '.' then write('Invalid input') else
    if (last mod 2 = 0) and (sum = 0) then write('Yes') else write('No');
end.
