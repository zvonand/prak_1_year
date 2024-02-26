{$R+,B+}
program task926(input, output);
const
    M = 3;
var
    n, i, x, y, z : integer;
    A, B, C: array[1..M, 1..M] of real;
begin
    writeln('Zvonov Andrey, 110 group, task 9.26');
    writeln('Enter the matrix: ');
    for i := 1 to M do
        for y := 1 to M do read(A[i, y]);
    writeln('Enter the power');
    read(n);
    B := A;
    C := A;
    for i := 2 to n do begin
        for x := 1 to M do
            for y := 1 to M do begin
                C[x, y] := 0;
                for z := 1 to M do C[x, y] := C[x, y] + A[z, y] * B[x, z];
            end;
        B := C;
    end;

    for i := 1 to M do begin
        for y := 1 to M do write(C[i, y]:5:2, ' ');
        writeln();
    end;
end.
