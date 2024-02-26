{$R+,B+}
program task927(input, output);
const
    N = 5;
var
    A: array[1..N, 1..N] of integer;
    x, y: integer;
    good: boolean;
begin
    writeln('Zvonov Andrey, 110 group, task 9.27');
    writeln('Enter the matrix:');
    for x := 1 to N do
        for y := 1 to N do read(a[x, y]);
    x := 1;
    y := 1;
    good := true;
    while (y <= N) and good do begin
        x := y + 1;
        while good and (x <= N) do begin
            if A[x, y] <> A[y, x] then good := false;
            x := x + 1;
        end;
        y := y + 1;
    end;
    writeln(good);
end.
