program task4(input, output);
var
    a, b: integer;

function multiply(a, b: integer): integer;
var
    neg: boolean;
begin
    neg := false;
    if a < 0 then begin
        neg := not neg;
        a := a - a - a;
    end;
    if b < 0 then begin
        neg := not neg;
        a := a - a - a;
    end;
    if (a = 0) or (b = 0) then multiply := 0 else
        if a = 1 then
            if neg then multiply := - b else multiply := b else
                if b = 1 then if neg then multiply := -a else multiply := a else
                    if neg then
                        multiply := -a - multiply(a, b - 1)
                        else
                            multiply := a + multiply(a, b - 1);
end;
begin
    writeln('Enter 2 numbers');
    read(a, b);
    writeln('By recursion: ', multiply(a, b));
    write('Standart: ',a * b);
end.
