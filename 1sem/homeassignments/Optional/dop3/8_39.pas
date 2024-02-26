{$R+,B+}
program task839(input, output);
const
    N = 10;
var
    x: array[1..N] of 1..(N + 1);
    y: integer;
    i, left, right: integer;
begin
    {generate an array containing all the elements except the only one}
    writeln('Zvonov Andrey, 110 group, optional task 8.39');
    writeln('Enter the "missing" number');
    read(y);
    for i := 1 to (y - 1) do x[i] := i;
    for i := y to N do x[i] := i + 1;
    for i := 1 to N do write(x[i], ' ');
    writeln();
    {using binary search, find the only missing element of the sequence}
    if x[1] = 2 then write(1) else if x[N] = N then write(N + 1) else begin
        left := 1;
        right := N;
        y := (right + left) div 2 + 1;
        while not ((x[y] > y) and (x[y - 1] = y - 1)) do begin
            if x[y] > y then right := y else
                if x[y] = y then left := y;
            y := (right + left) div 2 + (right + left) mod 2;
        end;
        write(y);
    end;
end.
