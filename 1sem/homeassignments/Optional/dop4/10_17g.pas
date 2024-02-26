{$R+,B+}
program tsk1017j(input, output);
const
    N = 5;
    K = 8;
var
    arr: array[1..N] of packed array[1..K] of char;
    inp: char;
    chkstr: packed array[1..26] of char;
    currword, currchar, i, x, y: integer;
    suits: boolean;
begin
    chkstr := 'abcdefghijklmnopqrstuvwxyz';
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
    {here the reading is over, start checking}
    for i := 1 to (currword - 1) do begin
        suits := true;
        x := 1;
        while suits and (x <= K) and (arr[i][x] <> ' ') do begin
            if arr[i][x] <> chkstr[x] then suits := false;
            x := x + 1;
        end;
        if suits then begin
            for y := 1 to (x - 1) do write(arr[i][y]);
            write(' ');
        end;
    end;
end.
