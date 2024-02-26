{$R+,B+}
program formula(input, output);
var
    flag: boolean;
    inp: char;

function test: boolean;
var
    flag: boolean;
begin
    test := false;
    read(inp);
    if (inp >= '0') and (inp <= '9') then test := true
        else if (inp = '(') then
            begin
                flag := test;
                if flag then
                    begin
                        read(inp);
                        if (inp = '+') or (inp = '*') or (inp = '-') then
                            begin
                                flag := test;
                                if flag then
                                    begin
                                        read(inp);
                                        if (inp <> ')') then flag := false;
                                    end;
                            end else flag := false;
                    end;
                    test := flag;
            end;
    end;
begin
    writeln('Zvonov Andrey, 110 group, optional task "Formula Check"');
    writeln('Enter the formula to check:');
    flag := test;
    read(inp);
    if (inp <> '.') then flag := false;
    if flag then writeln('This is a formula') else writeln('This is not a formula');
end.
