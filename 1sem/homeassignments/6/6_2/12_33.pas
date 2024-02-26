{$R+,B+}
program task1233(input, output);
var
    n: integer;

procedure Move(n : integer; a, b, c : char);
begin
    if (n = 1) then writeln('Move ', a, ' to ', c)
    else begin
        Move (n-1, a, c, b);
        writeln('Move ', a, ' to ', c);
        Move (n-1, b, a, c);
    end;
end;

begin
    writeln('Zvonov Andrey, 110 group, task 12.33');
    writeln('Enter number of rings: ');
    read(n);
    Move (n, '1', '2', '3');
end.
