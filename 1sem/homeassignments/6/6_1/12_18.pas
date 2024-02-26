{$R+,B+}
program task1218(input, output);
var
    a, b: integer;

function gcd1(a, b: integer): integer;
var modulo: integer;
begin
    modulo := a mod b;
    if modulo = 0 then gcd1 := b else
        gcd1 := gcd1(b, modulo)
end;

function gcd2(a, b: integer): integer;
begin
    if a = b then gcd2 := a else begin
        if a > b then gcd2 := gcd2(a-b, b) else
            gcd2 := gcd2(a, b - a);
    end;
end;

begin
    writeln('Zvonov Andrey, 110 group, task 12.18');
    writeln('Enter 2 numbers:');
    read(a, b);
    writeln(gcd1(a, b));
    writeln(gcd2(a, b));
end.
