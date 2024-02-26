program task2(input, output);
const
    n = 4;
    m = 5;
type
    matrix = array[1..n, 1..m] of 1..100;
var
    matr: matrix;
    x, y: integer;

function isCommon(var matr: matrix): boolean;
var
    x, y: integer;
    used, totl: set of 1..100;
    bool: boolean;
begin
    totl := [];
    for y := 1 to m do begin
        totl := totl + [matr[1, y]]
    end;
    for x := 2 to n do begin
        used := [];
        for y := 1 to m do begin
            used := used + [matr[x, y]]
        end;
        totl := totl * used;
    end;
    bool:= false;
    for x := 1 to 100 do
        if x in totl then begin
            write(x, ' ');
            bool := true;
        end;
    isCommon := bool;

end;

begin
    for x := 1 to n do
        for y := 1 to m do read(matr[x, y]);
    writeln();
    write(isCommon(matr));
end.
