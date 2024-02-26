{$R+,B+}
program chkprime(input, output);
var
    n: integer;

function isPrime(n: integer): boolean;
var
    range: integer;
    function helper(k: integer): boolean;
    begin
        if k = 2 then helper := (n mod k = 1) else
            helper := (n mod k <> 0) and helper(k - 1);
    end;
begin
    if n = 2 then isPrime := true else begin
        range := n div 2 + 1;
        isPrime := helper(range);
    end;
end;

begin
    writeln('Zvonov Andrey, 110 group, modulus 6.2, task 2');
    writeln('Enter your number:');
    read(n);
    writeln(isPrime(n));
end.
