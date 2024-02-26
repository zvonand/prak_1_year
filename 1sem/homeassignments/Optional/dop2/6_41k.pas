program task641k(input, output);
const
    move = 48;
var
    inp, prev: char;
    diff: integer;
    fits: boolean;
begin
    writeln('Zvonov Andrey, 110 group');
    writeln('Optional task 6.41k');
    read(inp);
    if (inp >= 'A') and (inp <= 'Z') then
        fits := true else
            fits := false;
    while (inp <> '.') do begin
        prev := inp;
        read(inp);
        if inp <> '.' then begin
            diff := ord(inp) - ord(prev);
            if (diff <> 1) or not ((inp >= 'A') and (inp <= 'Z')) then
                fits := false;
        end;
    end;
    writeln(fits);
end.
