program task2(input, output);
type
    str = packed array[1..6] of char;
    pointer = ^list;
    list = record
        data: str;
        quantity: integer;
        next: pointer;
    end;

var
    global: array[1..6] of pointer;
    i, currpos: integer;
    temp: str;
    inp: char;
    x: pointer;

procedure Insert(var curr: pointer; var toinsert: str);
begin
    if (curr = nil) then begin
        new(x);
        x^.data := toinsert;
        x^.quantity := 0;
        curr := x;
    end else begin
        {writeln(curr^.data = toinsert);}
        if curr^.data = toinsert then curr^.quantity := curr^.quantity + 1 else begin
            if (curr^.data > toinsert) then begin
                new(x);
                x^.next := curr;
                curr := x;
                x^.data := toinsert;
            end else
                Insert(curr^.next, toinsert);
        end;
    end;
end;

procedure Print(len: integer);
begin
    x := global[len];
    if x <> nil then begin
        writeln('Now printing ', len, '-digit(s) numbers');
        while x <> nil do begin
            writeln(x^.data);
            x := x^.next;
        end;
    end else writeln('No ', len, ' - digit numbers');
end;

begin
    read(inp);
    while inp <> '.' do begin
        currpos := 1;
        while (inp <> ',') and (inp <> '.') do begin
            temp[currpos] := inp;
            currpos := currpos + 1;
            read(inp);
        end;
        if inp = ',' then read(inp);
        for i := currpos to 6 do
            temp[i] := ' ';
        Insert(global[currpos - 1], temp);
    end;
    for i := 1 to 6 do Print(i);
end.
