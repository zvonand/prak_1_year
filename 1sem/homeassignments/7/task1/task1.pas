program task1(input, output);
type
    letter = set of 'a'..'z';
var
    vowels, letters: letter;
    t1: text;
    inp: char;
    i: char;
begin
    writeln('Zvonov Andrey, 110 group, task 1');
    assign(t1, 't1.txt');
    letters := [];
    vowels := ['a', 'e', 'i', 'o', 'u', 'y'];
    reset(t1);
    while not eof(t1) do begin
        while not eoln(t1) do begin
            read(t1, inp);
            letters := letters + [inp];
        end;
        readln(t1);
    end;
    writeln('Consonants in file:');
    for i := 'a' to 'z' do
        if not (i in vowels) and (i in letters) then write(i, ' ');
    writeln();
    writeln('Consonants not in file:');
    for i := 'a' to 'z' do
        if not (i in vowels) and not (i in letters) then write(i, ' ');
    writeln();
    writeln('Vowels in file:');
    for i := 'a' to 'z' do
        if (i in vowels) and (i in letters) then write(i, ' ');
    writeln();
    writeln('Vowels not in file:');
    for i := 'a' to 'z' do
        if (i in vowels) and not (i in letters) then write(i, ' ');
end.
