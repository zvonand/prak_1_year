program task1(input, output);
var
    inp: integer;

function isSame(n: integer): boolean;
var
    helper, i: integer;
    nums: set of 0..9;
    ret: boolean;
begin
    ret := false;
    nums := [];
    while n > 9 do begin
        helper := n mod 10;
        if helper in nums then ret := true
             else nums := nums + [helper];
        n := n div 10;
    end;
    if n in nums then ret := true;
    isSame := ret;
end;

begin
    read(inp);
    while (inp <> 0) do begin
        write(isSame(inp), ' ');
        read(inp);
    end;
end.
