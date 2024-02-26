{$R+,B+}
program task1160(input, output);
const
    M = 5;
    N = 3;
    number = 3;
type
    matrix = array [1..M, 1..N] of integer;
var
    matrs: array[1..number] of matrix;
    nulls: array[1..number] of integer;
    i, max: integer;

procedure input(var matr: matrix; lines, columns: integer);
var
    x, y: integer;
begin
    for x := 1 to lines do
        for y := 1 to columns do read(matr[x, y]);
end;

procedure output(var matr: matrix; lines, columns: integer);
var
    x, y: integer;
begin
    for x := 1 to lines do begin
        for y := 1 to columns do write(matr[x, y], ' ');
        writeln();
    end;
end;

function zlines(var matr: matrix; lines, columns: integer): integer;
var
    count, x, y: integer;
    null: boolean;
begin
    count := 0;
    for x := 1 to lines do begin
        null := true;
        for y := 1 to columns do
            if matr[x, y] <> 0 then null := false;
        if null then count := count + 1;
    end;
    zlines := count;
end;

begin
    writeln('Zvonov Andrey, 110 group, task 11.60');
    writeln('Enter the matrices:');
    max := 0;
    for i := 1 to number do begin
        input(matrs[i], M, N);
        nulls[i] := zlines(matrs[i], M, N);
        if nulls[i] > max then max := nulls[i];
    end;
    writeln('Here is the output:');
    for i := 1 to number do begin
        if nulls[i] = max then output(matrs[i], M, N);
        writeln();
    end;
end.
