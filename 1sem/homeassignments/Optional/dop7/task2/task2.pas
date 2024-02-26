{$R+,B+}
program task2(input, output);
var
    a, b, c, d: text;
    maxlen: integer;

function LongestPos(var fin: text; start: integer): integer;
var
    lp, pos, inp, prev: integer;
begin
    for pos := 1 to start do read(fin, prev);

end;

{considering that we count numbers in file starting from 1}
{function LongestPos(var fin: text; start: integer): integer;
var
    pos, inp, prev, lp: integer;
    sorted: boolean;
begin
    for pos := 1 to start do read(fin, prev); {skipping unnecessary items
    sorted := true;
    maxlen := 0;
    lp := pos;
    while not eof(fin) do begin
        read(fin, inp);
        pos := pos + 1;
        if inp < prev then begin
            sorted := false;
            maxlen := 0;
            lp := lp + 1;
            end else
                maxlen := maxlen + 1;
    end;
    LongestPos := lp;
end;

}
begin
    writeln('Zvonov Andrey, 110 group, optional task 2');
    assign(a, 'a.txt');
    assign(b, 'b.txt');
    assign(c, 'c.txt');
    assign(d, 'd.txt');
    reset(a);
    write(LongestPos(a, 1));
end.
