program task3(input, output);
var
    t3: text;
    max, pos, count, maxpos: integer;
    inp: char;
begin
    writeln('Zvonov Andrey, 110 group, task 3');
    max := 0;
    pos := 0;
    assign(t3, 't3.txt');
    reset(t3);
    while not eof(t3) do begin
        count := 0;
        pos := pos + 1;
        while not eoln(t3) do begin
            read(t3, inp);
            count := count + 1;
        end;
        if count > max then begin
            max := count;
            maxpos := pos;
        end;
        readln(t3);
    end;
    reset(t3);
    for pos := 1 to (maxpos - 1) do readln(t3);
    while not eoln(t3) do begin
        read(t3, inp);
        write(inp);
    end;
end.
