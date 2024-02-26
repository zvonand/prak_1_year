{$R+,B+}
program task1214(input, output);

function max:integer;
var
    inp, temp: integer;
begin
    read(inp);
    if inp = 0 then max := inp else begin
        temp := max;
        if temp < inp then
            max := inp else
                max := temp;
    end;
end;

begin
    writeln('Zvonov Andrey, 110 group, task 12.14');
    writeln('Enter the numbers: ');
    writeln(max);
end.
