program dop(input, output);
const
    N = 5;
type
    matr = array[1..N, 1..N] of integer;
var
    m, k: integer;
    matrix: matr;

procedure FillColumn(column, pos: integer);
begin
    matrix[column, pos] := matrix[column, pos - 1] - 1;
    if pos < N then
        FillColumn(column, pos + 1);
end;

procedure FillRow(row, pos: integer);
begin
    matrix[pos, row] := matrix[pos - 1, row] - 1;
    if pos < N then
        FillRow(row, pos + 1);
end;

procedure FillMatrix(level: integer);
begin
    matrix[level, level] := m;
    if level < N then begin
        FillRow(level, level + 1);
        FillColumn(level, level + 1);
        m := m + k;
        FillMatrix(level + 1);
    end;

end;

procedure Print;
var
    x, y: integer;
begin
    for x := 1 to N do begin
        for y := 1 to N do
            write(matrix[x, y] : 3);
        writeln();
    end;
end;

begin
    read(m, k);
    FillMatrix(1);
    Print;
end.
