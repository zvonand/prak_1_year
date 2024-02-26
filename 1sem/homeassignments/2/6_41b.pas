program task641b(input, output);
const
  move = 48;
var
  inp : char;
  sum : integer;
begin
  writeln('Zvonov Andrey, group 110, task 6.41b');
  writeln('Enter the number: ');
  read(inp);
  sum := 0;
  while (inp >= '0') and (inp <= '6') do begin
    sum := sum + ord(inp) - move;
    sum := sum mod 2;
    read(inp);
  end;
  if inp <> '.' then write('Invalid input') else
    if sum = 0 then write('Even') else write('Odd');
end.
