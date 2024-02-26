program beztroek(input, output);
var
    n: integer;

function delete3(n: integer): integer;
begin
    if n = 3 then delete3 := 0 else begin
        if (n <= 9) then begin
            delete3 := n;
        end
        else begin
            if n mod 10 <> 3 then
                delete3 := 10 * delete3(n div 10) + delete3(n mod 10) else
                    delete3 := delete3(n div 10);
        end;
    end;
end;

begin
    writeln('Zvonov Andrey, 110 group, modulus 6.2, task 1');
    writeln('Enter your number:');
    read(n);
    writeln(delete3(n));
end.
