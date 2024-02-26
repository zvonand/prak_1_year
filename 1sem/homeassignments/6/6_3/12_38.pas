{$R+,B+}
program task1238(input, output);
const
    n = 7;
var
    seq: array[1..n] of integer;
    i: integer;

procedure generate (m: integer);
var
    num, i: integer;
begin
if m = 1 then begin
    for i := 1 to n do
        write(seq[i], ', ');
        writeln;
    end
    else begin
    for i := m downto 1 do
        begin
            num := seq[i];
            seq[i] := seq[m];
            seq[m] := num;
            generate(m - 1);
            num := seq[i];
            seq[i] := seq[m];
            seq[m] := num;
        end;
    end;
end;

begin
    writeln('Zvonov Andrey, 110 group, task 12.38');
    writeln('Very slow when N exceeds 7');
    writeln('Current N is ', n);
    writeln('Enter the seq: ');
    for i := 1 to n do
        read(seq[i]);
    generate(n);
end.
