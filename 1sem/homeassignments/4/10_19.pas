{$R+,B+}
program task1019(input, output);
const
    N = 20;
var
    inp, outstr: packed array[1..N] of char;
    chkstr: packed array[1..52] of char;
    i, y: integer;
    meets: boolean;
begin
    writeln('Zvonov Andrey, 110 group, task 10.19');
    writeln('Enter your string:');
    for i := 1 to N do read(inp[i]);
    chkstr := 'QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm';
    for i := 1 to N do begin
        y := 1;
        meets := false;
        while (y <= 52) and not meets do begin
            if inp[i] = chkstr[y] then meets := true;
            y := y + 1;
        end;
        if meets then outstr[i] := '-' else outstr[i] := ' ';
    end;
    writeln(inp);
    write(outstr);
end.
