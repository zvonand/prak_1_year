program task524(input, output);
const pi = 3.14159;
var l, r, count, e, temp, eps, x : real;
begin
  writeln('Zvonov Andrey, 110 group, task 5.24');
  writeln('Enter epsilon: ');
  read(eps);
  e := 1;
  count := 1;
  temp := 1;
  while 1/temp > eps do begin
    e := e+(1/temp);
    count := count + 1;
    temp := temp*count;
  end;
  l := -1.0;
  r := 0.0;
  while (r-l) > eps do begin
    x := (r+l)/2;
    if pi*x*x*x - e*x*x + (2*e +1)*x + pi*pi > 0 then r := x else l := x;
  end;
  writeln('The root is ', x:0:10);
end.
