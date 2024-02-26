{Unfinished, has runtime errors I cannot filter}
program task2(input, output);
type
    pointer = ^list;
    list = record
        data: char;
        next: pointer;
        prev: pointer;
    end;
var
    fin, fout: text;
    head: pointer;

procedure Remove(pos: pointer);
begin
    writeln(pos^.data, ' to remove');
    if pos^.next <> nil then
        pos^.next^.prev := pos^.prev;
    if pos^.prev <> nil then
        pos^.prev^.next := pos^.next;
    dispose(pos);
    writeln('Removed successfully!');
end;

procedure Print(head: pointer);
begin
    write(head^.data);
    if not (head^.next = nil) then
        Print(head^.next);
end;

procedure Analyse(var head: pointer);
var
    x, next, past: pointer;
begin
    while head^.data = '#' do begin
        head := head^.next;
        dispose(head^.prev);
        head^.prev := nil;
    end;
    x := head;
    while x^.next <> nil do begin
        if x^.data = '#' then begin
            if x^.prev <> nil then
                Remove(x^.prev);
            if x^.next <> nil then begin
                x := x^.next;
                Remove(x^.prev);
            end else begin
                if x^.prev = nil then begin
                    dispose(x);
                    head := nil;
                end else begin
                    x := x^.prev;
                    Remove(x^.next);
                end;
            end;
        end;
    end;
end;

procedure MakeList(var head: pointer);
begin
    while not ( eoln(fin) or eof(fin)) do
        if head = nil then begin
            new(head);
            read(fin, head^.data);
            head^.next := nil;
        end else
            MakeList(head^.next);
end;

procedure ClearList(var head: pointer);
begin
    if not (head^.next = nil) then
        ClearList(head^.next);
    dispose(head);
end;

begin
    writeln('Andrey Zvonov, 110 group, optional task 2');
    assign(fin, 't1.txt');
    assign(fout, 't2.txt');
    reset(fin);
    rewrite(fout);
    head := nil;
    while not eof(fin) do begin
        MakeList(head);
        Print(head);
        writeln('before analyse');
        Analyse(head);
        writeln('After analyse');
        Print(head);
        ClearList(head);
        readln(fin);
    end;
end.
