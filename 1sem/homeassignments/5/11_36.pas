{$R+,B+}
program task1136(input, output);
const
    N = 6;
type
    word = packed array[1..N] of char;
var
    currword, prev, prevprev: word;
    punkt: char;

procedure readword(var w: word);
var
    i, j: integer;
    inp: char;
begin
    read(inp);
    i := 1;
    while (inp <> ',') and (inp <> '.') do begin
        w[i] := inp;
        read(inp);
        i := i + 1;
    end;
    for j := i to N do w[i] := ' ';
    punkt := inp;
end;

procedure writeword(w: word);
var
    i: integer;
begin
    for i := 1 to N do
        if w[i] <> ' ' then write(w[i]);
    write(' ');
end;

begin
    writeln('Zvonov Andrey, 110 group, task 11.36');
    writeln('Enter your words:');
    readword(prevprev);
    if punkt <> '.' then
        readword(prev);
    if punkt <> '.' then
        repeat begin
            readword(currword);
            if (prev = currword) and (prev = prevprev) then writeword(prev);
            prevprev := prev;
            prev := currword;
        end until punkt = '.';
end.
