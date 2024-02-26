{$R+,B+}
program task856(input, output);
var
  nums : array['a'..'z'] of integer;
  inp : char;
begin
  writeln('Zvonov Andrey, 110 group, task 8.56');
  writeln('Enter your sequence: ');
  for inp := 'a' to 'z' do nums[inp] := 0;
  read(inp);
  while inp <> '.' do begin
    nums[inp] := nums[inp] + 1;
    read(inp);
  end;
  for inp := 'a' to 'z' do
    if nums[inp] = 1 then write(inp, ' ');  
end.
