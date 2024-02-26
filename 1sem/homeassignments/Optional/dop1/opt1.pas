program opt1(input, output);
var
  n, p, q, counter : integer;
begin
  writeln('Zvonov Andrey, 110 group, optional task 1');
  writeln('Enter the 2 numbers you wwant to divide');
  read(p, q);
  writeln('Precision: ');
  read(n);
  counter := 0;
  write(p div q);
  p := p mod q;
  write('.');
  while counter < n do begin
    counter := counter + 1;
    p := p*10;
    write(p div q);
    p := p mod q;
  end;
end.
