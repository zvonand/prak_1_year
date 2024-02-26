program task3(input, output);
const
  n = 5;
type
  matrix = array[1..n,1..n] of integer;
var
  tri: boolean;
  matr: matrix;
procedure inp(dim: integer; var mat: matrix);
var
  i, y: integer;
begin
  for i := 1 to dim do
    for y := 1 to dim do read(mat[i, y]);
end;
function check(var mat: matrix):boolean;
var
  i, y: integer;
  suit: boolean;
begin
  i := 1;
  y := 2;
  suit := true;
  while suit and (i <= n) do begin
    y := 1;
    while suit and (y < i) do begin
      if mat[i, y] <> 0 then suit := false;
        y := y + 1;
    end;
    i := i + 1;
  end;
  check := suit;
end;

begin
  inp(n, matr);
  tri := check(matr);
  write(tri);

end.
