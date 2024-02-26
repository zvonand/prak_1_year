{$R+,B+}
program longs(input, output);
const
    LEN = 255;
type
    number = array[1..LEN] of integer;
var
    power: number;

procedure print(n: number);
var
    first, i: integer;
begin
    first := 1;
    while n[first] = 0 do first := first + 1;
    for i := first to LEN do write(n[i]);
end;

function add(var a, b: number): number;
var
    carry, temp, i: integer;
    res: number;
begin
    carry := 0;
    for i := LEN downto 1 do begin
        temp := a[i] + b[i] + carry;
        res[i] := temp mod 10;
        carry := temp div 10;
    end;
    add := res;
end;

function inttonum(var n: integer): number;
var
    first, i: integer;
    result: number;
begin
    first := LEN;
    while n > 0 do begin
        result[first] := n mod 10;
        n := n div 10;
        first := first - 1;
    end;
    for i := 1 to first do result[i] := 0;
    inttonum := result;
end;

function mult(var a: number; n: integer): number;
var
    i: integer;
    res: number;
begin
    res := a;
    for i := 2 to n do res := add(res, a);
    mult := res;
end;

procedure factsum(n: integer);
var
    fact, prevfact, sum: number;
    i: integer;
begin
    i := 1;
    sum := inttonum(i);
    prevfact := sum;
    for i := 2 to n do begin
        fact := mult(prevfact, i);
        prevfact := fact;
        sum := add(sum, fact);
    end;
    print(sum);
end;

function twopower(n: integer): number;
var
    i: integer;
    init: number;
begin
    for i := 1 to 254 do init[i] := 0;
    init[LEN] := 2;
    for i := 2 to n do begin
        init := add(init, init);
        {print(init);
        writeln();}
    end;
    twopower := init;
end;

begin
    writeln('Zvonov Andrey, 110 group, additional task, modulus 5');
    power := twopower(500);
    print(power);
    writeln();
    factsum(100);
end.
