program task4(input, output);
const
  n = 5;
  m = 4;
type
  matrix = array[1..n, 1..m] of real;
var
  A: matrix;
  max: real;

procedure inp(var matr: matrix);
var
  i, y: integer;
begin
  for i := 1 to n do
    for y := 1 to m do read(matr[i, y]);
end;
procedure MaxMin(var matr: matrix; var locmax: real);
var
  min: real;
  i, y: integer;
begin
  locmax := matr[1, 1];
  for i:= 1 to m do if matr[1, i] < locmax then locmax:= matr[1, i];
  for i := 2 to n do begin
    min := matr[i, 1];
    for y := 2 to m do begin
      if matr[i, y] < min then min := matr[i, y];
    end;
    if min > locmax then locmax := min;
  end;
end;

begin
  inp(A);
  MaxMin(A, max);
  write(max:0:4);
end.
