{$R+,B+}
program task1126(input, output);
const
    N = 4;
type
    vector = array[1..N] of real;
var
    x, y, z: vector;
    minx, miny, minz, result: real;

procedure vectinput(dim: integer; var v: vector);
var
    i: integer;
begin
    for i := 1 to dim do read(v[i]);
end;

function mincoord(var v: vector; dim: integer): real;
var
    min, i: integer;
begin
    min := 1;
    for i := 2 to dim do if v[i] < v[min] then min := i;
    mincoord := v[min];
end;

function vectmult(a, b: vector; dim: integer): real;
var
    res: real;
    i: integer;
begin
    res := 0;
    for i := 1 to dim do res := res + a[i] * b[i];
    vectmult := res;
end;

begin
    writeln('Zvonov Andrey, 110 group, task 11.26');
    writeln('Enter three ', N, '-dimensional vectors:');
    vectinput(N, x);
    vectinput(N, y);
    vectinput(N, z);
    minx := mincoord(x, N);
    miny := mincoord(y, N);
    minz := mincoord(z, N);
    if (minx > miny) and (minx > minz) then
        result := vectmult(x, x, N) - vectmult(y, z, N) else if (miny > minx) and (miny > minz) then
            result := vectmult(y, y, N) - vectmult(x, z, N) else if (minz > minx) and (minz > miny) then
                result := vectmult(z, z, N) - vectmult(x, y, N);
    write(result:0:2);
end.
