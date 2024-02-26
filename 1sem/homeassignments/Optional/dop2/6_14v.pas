program task614v(input, output);
var
  i, y, curr: char;
begin
  writeln('Zvonov Andrey, 110 group');
  writeln('Optional task 6.14v, modulus 2');
  for i := '0' to '9' do begin
    for y := '0' to '9' do begin
      curr := chr(ord(i) + ord(y) - ord('0'));
      if curr > '9' then curr := chr(ord(curr)-10);
      write(curr);
    end;
    writeln();
  end;
end.
