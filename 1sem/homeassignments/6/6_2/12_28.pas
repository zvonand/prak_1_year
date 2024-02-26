{$R+,B+}
program task1228(input, output);
procedure Print;
var
    inp: char;
begin
    read(inp);
    if (inp = '(') then
    begin
        Print;
        read(inp);
        Print;
        write(inp);
        read(inp);
    end
    else write(inp);
end;

begin
    writeln('Zvonov Andrey, 110 group, task 12.28');
    writeln('Enter your expression: ');
    Print;
end.
