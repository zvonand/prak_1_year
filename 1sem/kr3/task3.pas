program task3(input, output);
var
    n: integer;

function ChangeTo2(n: integer): integer;
begin
    if n <= 9 then ChangeTo2 := 2 else begin
        ChangeTo2 := n mod 10 + 10 * (ChangeTo2(n div 10));
    end;
end;

begin
    writeln('Enter N:');
    read(n);
    write(ChangeTo2(n));
end.
