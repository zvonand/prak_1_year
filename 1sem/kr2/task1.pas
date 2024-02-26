program task1(input, output);
const
  a = 3.15;
var
  sum, eps: real;
  sign, curr, mult, i: integer;
begin
  sign := -1;
  curr := 2;
  eps := 1E-12;
  sum := a;
  mult := 1;
  while 1/(abs(mult)) >= eps do begin
    mult := 1;
    for i := curr to (curr + 6) do mult := mult * curr;
    sum := sum + sign / mult;
    sign := sign * (-1);
    curr := curr + 2;
  end;
  writeln(sum:0:10);
end.
