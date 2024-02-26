{$R+,B+}
program task1235(input, output);
const
    N = 10;
type
    matrix = array [1..N, 1..N] of boolean;
var
    x, y, f, l: integer;
    matr: matrix;
    val: boolean;

function path(var lab: matrix; first,last: integer): boolean;
var
    visited: array[1..N] of boolean;
    i, l: integer;
    way: array[1..N] of 1..N;
function path1(r1, r2: integer): boolean;
var
    r: integer;
    ok: boolean;
begin
    if r1 = r2 then path1 := true else begin
        ok := false;
        r := 0;
        repeat
            r := r + 1;
            if (lab[r1, r] = true) and not visited[r] then begin
                visited[r] := true;
                l := l + 1;
                way[l] := r;
                if path1(r, r2) then ok := true else l := l - 1;
            end;
        until (ok) or (r = N);
        path1 := ok;
    end;
end;

begin
    for i := 1 to N do visited[i] := false;
    visited[first] := true;
    l := 1;
    way[l] := first;
    if path1(first, last) then begin
        for i := 1 to (l - 1) do write(way[i], ' -> ');
        write(way[l]);
        path := true;
    end else path := false;
end;


begin
    writeln('Zvonov Andrey, 110 group, task 12.35');
    writeln('');
    for x := 1 to N do
        for y := 1 to n do
            matr[x, y] := false;
    writeln('Enter the numbers, after the final ones enter "0 0"');
    read(x, y);
    while not ((x = 0) and (y = 0)) do begin
        matr[x, y] := true;
        matr[y, x] := true;
        read(x, y);
    end;
    writeln('Enter the beginning and ending: ');
    read(f, l);
    val := path(matr, f, l);
    if not val then writeln('No way');
end.
