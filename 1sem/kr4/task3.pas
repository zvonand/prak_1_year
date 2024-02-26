program task3(input, output);
var
    inp, out: text;

procedure copy(var i, o: text);
var
    c: char;
    count, j: integer;
    towrite: array[1..256] of char;
begin
    while not eof(i) do begin
        count := 0;
        while not eoln(i) do begin
            read(i, c);
            count := count + 1;
            towrite[count] := c;
        end;
        if (count >= 3) and (count <= 10) then begin
            for j := 1 to count do write(o, towrite[j]);
            writeln(o);
        end;
        readln(i);
    end;
end;

begin
    assign(inp, 'source4.txt');
    assign(out, 'dest4.txt');
    reset(inp);
    rewrite(out);
    copy(inp, out);
    close(inp);
    close(out);
end.
