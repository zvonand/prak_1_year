program task6367(input, output);
const
    move = 48;
var
    inp: char;
    num, tens: real;
    sign, i, mult: integer;
    e, dot: boolean;
begin
    writeln('Zvonov Andrey, 110 group');
    writeln('Optional task 6_36_7');
    writeln('Input your number');
    read(inp);
    num := 0.0;
    e := false;
    dot := false;
    tens := 1;
    sign := 1;
    mult := 0;
    while(inp <> ' ') do begin
        if inp = 'E' then begin
            e := true;
            mult := 0;
            read(inp);
        end;
        if inp = '-' then begin
            sign := -1;
            read(inp);
        end else if inp = '+' then begin
            sign := 1;
            read(inp);
        end;
        if (inp = ',') or (inp = '.') then begin
            tens := 0.1;
            read(inp);
            dot := true;
        end;
        if not e and not dot then begin
            if sign > 0 then
                num := num * 10 + (ord(inp) - move) else
                    num := num * 10 - (ord(inp) - move);
        end;
        if not e and dot then begin
            num := num + (ord(inp) - move) * tens;
            tens := tens / 10;
        end;
        if e then begin
            mult := mult * 10 + (ord(inp) - move);
        end;
        read(inp);
    end;
    if sign > 0 then
        for i := 1 to mult do num := num * 10 else
            for i := 1 to mult do num := num / 10;
    {The number is now read}
    {now let's make the number to be like 0.x * 10^y}
    if num < 0 then begin
        write('-');
        num := (-1) * num;
    end;
    write('0.');
    mult := 0;
    while num >= 1 do begin
        num := num / 10;
        mult := mult + 1;
    end;
    while num < 0.1 do begin
        num := num * 10;
        mult := mult - 1;
    end;
    for i := 1 to 9 do begin
        write(chr(round(trunc(num / 0.1)) + move));
        num := 10 * num - trunc(10 * num);
    end;
    write('E');
    if mult >= 0 then write('+') else write('-');
    mult := abs(mult);
    tens := 10;
    for i := 1 to 2 do begin
        write(chr(round(mult/tens) + move));
        mult := mult mod round(tens);
        tens := 1;
    end;
end.
