{$R+,B+}
program tsk1017j(input, output);
const
    N = 5;
    K = 8;
var
    arr: array[1..N] of packed array[1..K] of char;
    inp: char;
    currword, currchar, i, x, y: integer;
    first: boolean;
begin
    writeln('Zvonov Andrey, 110 group');
    writeln('Optional task 10.17 j');
    read(inp);
    currword := 1;
    while inp <> '.' do begin
        currchar := 1;
        while (inp <> ' ') and (inp <> '.') do begin
            arr[currword][currchar] := inp;
            currchar := currchar + 1;
            read(inp);
        end;
        for i := currchar to K do arr[currword][i] := ' ';
        currword := currword + 1;
        if inp <> '.' then read(inp);
        while inp = ' ' do read(inp);
    end;
    {here the reading is over, start checking now}
    for i := 1 to (currword - 1) do begin
        x := 1;
        first := true;
        while first and (x <= K) and (arr[i][x] <> ' ') do begin
            for y := 1 to (x - 1) do
                if arr[i][x] = arr[i][y] then first := false;
            x := x + 1;
        end;
        if first then begin
            for y := 1 to (x - 1) do write(arr[i][y]);
            write(' ');
        end;
    end;
end.
