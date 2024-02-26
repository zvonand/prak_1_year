{$R+,B+}
program task1014(input, output);
var
    arr: array[1..9] of packed array[1..4] of char;
    input, i: integer;
begin
    writeln('Zvonov Andrey, 110 group, task 10.14');
    writeln('Enter your number:');
    read(input);
    arr[1] := 'I   ';
    arr[2] := 'II  ';
    arr[3] := 'III ';
    arr[4] := 'IV  ';
    arr[5] := 'V   ';
    arr[6] := 'VI  ';
    arr[7] := 'VII ';
    arr[8] := 'IIX ';
    arr[9] := 'IX  ';
    for i := 1 to (input div 10) do write('X');
    input := input mod 10;
    if input > 0 then write(arr[input], ' ') else write(' ');
end.
