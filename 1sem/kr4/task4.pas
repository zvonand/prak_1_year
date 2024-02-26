program task4(input, output);
type
    TF = file of integer;
var
    f1, f2, f3: TF;
    d1, d2, d3: text;

function isgr(var f: TF): boolean;
var
    i, max: integer;
    bool: boolean;
begin
    reset(f);
    bool := false;
    if not eof(f) then begin
        read(f, i);
        max := i;
    end;
    while not eof(f) do begin
        read(f, i);
        if i > max then begin
            max := i;
            bool := true;
        end else bool := false;
    end;
    isgr := bool;
end;

procedure decypher(var fi: TF; var fo: text);
var
    inp, tens, pos, i: integer;
    temp: packed array[1..5] of char;
begin
    reset(fi);
    rewrite(fo);
    while not eof(fi) do begin
        read(fi, inp);
        tens := 10000;
        pos := 1;
        while inp div tens = 0 do tens := tens div 10;
        while tens >= 1 do begin
            temp[pos] := chr(inp div tens + ord('0'));
            inp := inp mod tens;
            tens := tens div 10;
            pos := pos + 1;
        end;
        for i := 1 to pos - 1 do write(fo, temp[i]);
        writeln(fo);
    end;
    close(fo);
end;

begin
    assign(d1, 'num1.txt');
    assign(d2, 'num2.txt');
    assign(d3, 'num3.txt');
    assign(f1, 'num1.bin');
    assign(f2, 'num2.bin');
    assign(f3, 'num3.bin');
    decypher(f1, d1);
    decypher(f2, d2);
    decypher(f3, d3);
    writeln(isgr(f1));
    writeln(isgr(f2));
    writeln(isgr(f3));
end.
