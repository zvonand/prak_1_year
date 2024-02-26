program task5(input, output);
var
    max, t : integer;

function count: integer;
var
    curr, inp: integer;
begin
    read(inp);
    curr := 0;
    if inp = 0 then count := 0 else begin
        if inp = 5 then begin
            curr := 1 + count;
            if curr > max then max := curr;
        end
        else begin
            curr := count;
            if curr > max then max := curr;
            count := 0;
        end;
    end;
end;

begin
    max := 0;
    t := count;
    write(t);
end.
