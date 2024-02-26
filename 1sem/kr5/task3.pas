program task3(input, output);
type
    pointer = ^list;
    list = record
        data: integer;
        next: pointer;
    end;
var
    head, x: pointer;
    toProceed: boolean;

procedure Create(var head: pointer);
var
    inp: integer;
    prev: pointer;
begin
    read(inp);
    prev := nil;
    while inp <> 0 do begin
        new(x);
        x^.data := inp;
        x^.next := prev;
        prev := x;
        read(inp);
    end;
    head := x;
end;

procedure Print(var head: pointer);
begin
    write(head^.data, ' ');
    if not (head^.next = nil) then
        Print(head^.next);
end;

function IsArithm(head: pointer): boolean;
var
    diff: integer;
    return: boolean;
begin
    return := true;
    if head^.next = nil then
        return := true else
            if head^.next^.next = nil then return := true else begin
                diff := head^.next^.data - head^.data;
                head := head^.next;
                while not (head^.next = nil) and return do begin
                    if diff <> (head^.next^.data - head^.data) then
                        return := false;
                    head := head^.next;
                end;
            end;
    IsArithm := return;
end;

procedure Move(var head: pointer);
var
    last: pointer;
begin
    if not (head^.next = nil) then begin
        if not (head^.next^.next = nil) then begin
            last := head;
            while not (last^.next^.next = nil) do
                last := last^.next;
            if last <> head then begin
                last^.next^.next := head;
                head := last^.next;
                last^.next := nil;
            end;
        end else begin
            last := head^.next;
            head^.next := nil;
            last^.next := head;
            head := last;
        end;
    end;
end;

procedure Unique(head: pointer);
var
    temp: pointer;
begin
    while not (head^.next = nil) do begin
        temp := head^.next;
        if head^.data = temp^.data then begin
            head^.next := temp^.next;
            dispose(temp);
        end else head := head^.next;

    end;
end;

begin
    Create(head);
    Print(head);
    toProceed := IsArithm(head);
    writeln();
    if toProceed then
        Move(head) else
            Unique(head);
    Print(head);
end.
