{$R+,B+}
program task1216(input, output);

procedure print;
var
    inp: char;
begin
    read(inp);
    if inp <> '.' then begin
        print;
        write(inp);
    end;
end;

begin
    writeln('Zvonov Andrey, 110 group, task 12.16');
    writeln('Enter the text:');
    print;
end.
