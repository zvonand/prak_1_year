{$R+,B+}
program task1127(input, output);
const
    N = 3;
type
    matrix = array[1..N, 1..N] of real;
var
    a, b: matrix;

procedure input(var inp: matrix; dim: integer);
var
    i, y: integer;
begin
    for i := 1 to dim do
        for y := 1 to dim do read(inp[i, y]);
end;

procedure output(var out: matrix; dim: integer);
var
    i, y: integer;
begin
    for i := 1 to dim do begin
        for y := 1 to dim do write(out[i, y]:0:2, ' ');
        writeln();
    end;
end;

function track(var matr: matrix; dim: integer): real;
var
    res: real;
    i: integer;
begin
    res := 0;
    for i := 1 to dim do res := res + matr[i, i];
    track := res;
end;

function square(var inp: matrix; dim: integer): matrix;
var
    res: matrix;
    i, y, z: integer;
begin
    for i := 1 to dim do
        for y := 1 to dim do begin
            res[i, y] := 0;
            for z := 1 to dim do
                res[i, y] := res[i, y] + inp[i, z] * inp[z, y];
        end;
    square := res;
end;

begin
    writeln('Zvonov Andrey, 110 group, task 11.27');
    writeln('Enter 2 matrices:');
    input(a, N);
    input(b, N);
    if track(a, N) < track(b, N) then begin
        a := square(a, N);
        output(a, N);
    end else begin
        b := square(b, N);
        output(b, N);
    end;
end.
