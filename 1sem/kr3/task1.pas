program task1(input, output);
const
    N = 4;
type
    matrix = array[1..N, 1..N] of integer;
var
    k, p: integer;
    m: matrix;

procedure Form(var matr: matrix; k, p: integer);
var
    x, y: integer;
begin
    for x := 0 to (N - 1) do begin
        for y := 0 to (N - 1) do matr[x + 1, y + 1] := k + (p * y) + x;
    end;
end;

procedure print(var matr: matrix);
var
    x, y: integer;
begin
    for x := 1 to N do begin
        for y := 1 to N do write(matr[x, y]:5, ' ');
        writeln();
    end;
end;

function test(var matr: matrix): boolean;
var
    i, y, str: integer;
    chk: boolean;
begin
    chk := false;
    for i := 1 to N do begin
        str := 0;
        for y := 1 to N do
            str := str + matr[i, y];
        if str = 0 then chk := true;
    end;
    test := chk;
end;

begin
    writeln('Enter k, p');
    read(k, p);
    Form(m, k, p);
    print(m);
    writeln();
    write(test(m));
end.
