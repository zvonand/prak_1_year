program task2(input, output);
var
    t1, t2: text;
    res: boolean;
    a, b: char;
begin
    writeln('Zvonov Andrey, 110 group, task 2');
    res := true;
    assign(t1, 't1.txt');
    assign(t2, 't2.txt');
    reset(t1);
    reset(t2);
    while not eof(t1) and not eof(t2) and res do begin
        while not eoln(t1) and not eoln(t2) and res do begin
            read(t1, a);
            read(t2, b);
            if a <> b then res := false;
        end;
        if not eoln(t1) or not eoln(t2) then res := false;
        readln(t1);
        readln(t2);
    end;
    if not eof(t1) or not eof(t2) then res := false;
    write(res);
end.
