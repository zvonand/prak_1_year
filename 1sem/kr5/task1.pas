program task1(input, output);
const
    N = 20;
type
    str = packed array[1..N] of char;

var
    fin, fout: text;


procedure Format;
var
    currstr: str;
    curr, i: integer;
begin
    curr := 0;
    while not eoln(fin) do begin
        curr := curr + 1;
        read(fin, currstr[curr]);
    end;
    for i := 1 to (N - curr) do
        write(fout, ' ');
    for i := 1 to curr do
        write(fout, currstr[i]);
end;

begin
    assign(fin, 'file1.txt');
    assign(fout, 'file2.txt');
    reset(fin);
    rewrite(fout);
    while not eof(fin) do begin
        if not eoln(fin) then begin
            Format;
        end;
        readln(fin);
        writeln(fout);
    end;
    close(fin);
    close(fout);
end.
