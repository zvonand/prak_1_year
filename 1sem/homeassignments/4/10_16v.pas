{$R+,B+}
program tsk1016v(input, output);
const
    N = 10;
    K = 5;
var
    words: array[1..N] of packed array[1..K] of char;
    currword, currpos: integer;
    inp: char;
    i, y: integer;
    first: boolean;
begin
    writeln('Zvonov Andrey, 110 group, task 10.16v');
    writeln('Enter your words: ');
    read(inp);
    currword := 1;
    while inp <> '.' do begin
        currpos := 1;
        while (inp <> ',') and (inp <> '.') do begin
            words[currword][currpos] := inp;
            currpos := currpos + 1;
            read(inp);
        end;
        if currpos <= 5 then
            for i := currpos to 5 do
                words[currword][i] := ' ';
        currword := currword + 1;
        if inp = ',' then read(inp);
    end;
    for i := 1 to (currword - 1) do begin
        first := true;
        for y := 1 to (i - 1) do
            if words[i] = words[y] then first := false;
        if first then write(words[i], ' ');
    end;
end.
