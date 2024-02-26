program task1227(input, output);
function executor: boolean;
var
    inp: char;
    b: boolean;
begin
    read(inp);
    if inp = 't' then begin
        read(inp, inp, inp);
        executor := true;
    end else if inp = 'f' then begin
        read(inp, inp, inp, inp);
        executor := false;
    end else if inp = 'a' then begin
        read(inp, inp, inp);
        b := true;
        repeat begin
            b := b and executor;
            read(inp);
            end
        until (inp = ')');
        executor := b;
    end else if inp = 'o' then begin
        read(inp, inp);
        b := false;
        repeat begin
            b := b or executor;
            read(inp);
            end
        until (inp = ')');
        executor := b;
    end else if inp = 'n' then begin
        read(inp, inp, inp);
        executor := not executor;
        read(inp);
    end;
end;
begin
    writeln('Zvonov Andrey, 110 group, task 12.27');
    writeln('Enter the expression:');
    writeln(executor);
end.
