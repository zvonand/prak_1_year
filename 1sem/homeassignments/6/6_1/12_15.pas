{$R+,B+}
program task1215(input, output);

function digits: integer;
var
    inp: char;
begin
    read(inp);
    if inp = '.' then digits := 0 else begin
        if (inp >= '0') and (inp <= '9') then
            digits := 1 + digits else
            digits := digits;
    end;
end;

begin
    writeln('Zvonov Andrey, 110 group, task 12.15');
    writeln('Enter the sequence');
    writeln(digits);
end.
