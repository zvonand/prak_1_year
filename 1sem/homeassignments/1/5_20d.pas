program task520d(input, output);
var
  eps, m, x, result : real;
  count : integer;
begin
  writeln('Zvonov Andrey, 110 group, task 5.20d');
  writeln('Enter epsilon: ');
  read(eps);
  writeln('Enter x: ');
  read(x);
  m := -1 * x;
  count := 0;
  result := 0;
  while abs(m) > eps do begin
    result := result - m;
    count := count+1;
    m := m*x*x*(count*2-1)/(count*2+1);
    m := -1 * m;
  end;
  writeln(result:7:5);
  writeln('Built-in arctan: ', arctan(x):7:5);

end.
