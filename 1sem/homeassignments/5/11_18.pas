{$R+,B+}
program task1118(input, output);
var
    a, b, c, temp: integer;

function Subtr(a, b: integer):integer;
begin
    while a <> b do
        if a > b then
            a := a - b else
            b := b - a;
    Subtr := b;
end;

function Euclid(a, b: integer): integer;
    var modulo: integer;
    begin
        modulo := a mod b;
        while modulo <> 0 do begin
            a := b;
            b := modulo;
            modulo := a mod b;
        end;
        Euclid := b;
    end;

begin
    writeln('Zvonov Andrey, 110 group, task 11.18');
    writeln('Enter three integers;');
    read(a, b, c);
    temp := Subtr(a, b);
    writeln(Subtr(temp, c), ' by subtraction');
    temp := Euclid(a, b);
    write(Euclid(temp, c), ' by Euclidean algorithm');
end.
