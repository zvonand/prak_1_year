program task1226(input, output);

function executor: integer;
var
    inp: char;
    num1, num2: integer;
begin
    read(inp);
    if (inp = 'M') then begin
        read(inp);
        num1 := executor;
        read(inp);
        num2 := executor;
        if num1 > num2 then executor := num1 else executor := num2;
        read(inp);
    end else if (inp = 'm') then begin
        read(inp);
        num1 := executor;
        read(inp);
        num2 := executor;
        if num1 > num2 then executor := num2 else executor := num1;
        read(inp);
    end else
        if (inp >= '0') and (inp <= '9') then executor := ord(inp) - ord('0');
end;

begin
    writeln('Zvonov Andrey, 110 group, task 12.26');
    writeln('Enter the formula:');
    writeln(executor);
end.
