{$R+,B+}
program task1155(input, output);
var
    n, i, previous: integer;

function chkprime(k: integer): boolean;
var
    i: integer;
    prime: boolean;
begin
    prime := true;
    for i := 2 to (k div 2) do
        if k mod i = 0 then prime := false;
    chkprime := prime;
end;

begin
    writeln('Zvonov Andrey, 110 group, task 11.55');
    writeln('Enter n:');
    read(n);
    i := 5;
    previous := 3;
    while i <= n do begin
        if chkprime(i) then begin
            if i - previous = 2 then writeln(previous, ' ', i);
            previous := i;
        end;
        i := i + 2;
    end;
end.
