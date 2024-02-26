{$R+,B+}
program task859(input, output);
var
    letters: array['a'..'z'] of integer;
    met: array['a'..'z'] of boolean;
    inp, i, max: char;
begin
    writeln('Zvonov Andrey, 110 group, optional task 8.59');
    writeln('Enter your sequence:');
    max := 'a';
    for i := 'a' to 'z' do letters[i] := 0;
    read(inp);
    while inp <> '.' do begin
        for i := 'a' to 'z' do met[i] := false;
        while (inp <> '.') and (inp <> ',') do begin
            if not met[inp] then begin
                letters[inp] := letters[inp] + 1;
                met[inp] := true;
            end;
            read(inp);
        end;
        if inp = ',' then read(inp);
    end;
    for i := 'a' to 'z' do
        if letters[i] > letters[max] then max := i;
    for i := 'a' to 'z' do
        if letters[max] = letters[i] then write(i, ' ');
end.
