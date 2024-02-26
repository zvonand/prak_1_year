program task1(input, output);

type
    pointer = ^list;
    list = record
        data: char;
        next: pointer;
    end;

var
    fin, fout: text;
    head, x, y: pointer;

procedure Move;
var
    curr: pointer;
begin
    curr := head;
    while curr <> nil do begin
        write(fout, curr^.data);
        curr := curr^.next;
    end;
    writeln(fout);
end;

procedure Destroy(var start: pointer);
begin
    if start^.next <> nil then Destroy(start^.next);
    dispose(start);
end;

procedure Create;
var
    count: integer;
    inp, last: char;
    st: set of char;
begin
    st := ['1', '3', '5', '7', '9'];
    count := 0;
    head := nil;
    while not eoln(fin) do begin
        new(x);
        read(fin, inp);
        last := inp;
        x^.data := inp;
        if head = nil then head := x
            else y^.next := x;
        y := x;
        count := count + 1;
    end;
    y^.next := nil;
    if (count > 1) and (last in st) then begin
        Move;
        Destroy(head);
    end;
    readln(fin);
end;

begin
    assign(fin, 'file1.txt');
    assign(fout, 'file2.txt');
    reset(fin);
    rewrite(fout);
    while not eof(fin) do
        Create;
    close(fin);
    close(fout);

end.
