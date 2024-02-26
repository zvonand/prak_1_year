program task1(input, output);
type
    name = packed array[1..10] of char;
    pointer = ^list;
    list = record
        data: name;
        next: pointer;
    end;
var
    k, kidsleft: integer;
    fin: text;
    head, x, y, z: pointer;

function ReadLine(var fin: text): name;
var
    temp: name;
    inp: char;
    count, i: integer;
begin
    count := 1;
    while not eoln(fin) do begin
        read(fin, inp);
        temp[count] := inp;
        count := count + 1;
    end;
    for i := count to 10 do temp[i] := ' ';
    readln(fin);
    ReadLine := temp;
end;

{procedure Print(head: pointer);
var
    i: integer;
    x: pointer;
begin
    x := head;
    writeln(kidsleft);
    for i := 1 to kidsleft do begin
        write(x^.data);
        x := x^.next;
    end;
    writeln();
    writeln();
end;}

procedure CreateList(var fin: text);
begin
    reset(fin);
    while not eof(fin) do begin
        kidsleft := kidsleft + 1;
        new(x);
        x^.data := ReadLine(fin);
        if head = nil then head := x else
            y^.next := x;
        y := x;
    end;
    y^.next := head;
end;

procedure Delete(interval: integer; var init: pointer);
var
    i, temp: integer;
    x: pointer;
begin
    while kidsleft >= 1 do begin
        temp := interval;
        while temp > kidsleft do
            temp := temp - kidsleft;
        temp := temp + kidsleft;
        for i := 2 to temp do
            init := init^.next;
        with init^ do begin
            writeln(next^.data);
            x := next^.next;
            dispose(next);
            next := x;
        end;
        kidsleft := kidsleft - 1;
    end;
end;

begin
    writeln('Zvonov Andrey, 110 group, optional task 1');
    writeln('Enter k:');
    read(k);
    writeln('Here is the sequence: ');
    kidsleft := 0;
    assign(fin, 'friends.txt');
    CreateList(fin);
    new(z);
    z^.next := head;
    Delete(k, z);
    dispose(z);
    close(fin);
end.
