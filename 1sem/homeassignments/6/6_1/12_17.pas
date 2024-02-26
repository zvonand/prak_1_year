{$R+,B+}
program task1217(input, output);

procedure print;
var
    inp: integer;
begin
    read(inp);
    if inp < 0 then begin
        write(inp, ' ');
        print;
    end else if inp > 0 then begin
        print;
        write(inp, ' ');
    end;
end;

begin
    writeln('Zvonov Andrey, 110 group, task 12.17');
    writeln('Enter the numbers:');
    print;
end.
