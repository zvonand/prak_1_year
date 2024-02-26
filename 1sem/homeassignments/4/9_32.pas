{$R+,B+}
program task932(input, output);
var
    pairs: array['a'..'z', 'a'..'z'] of 0..MaxInt;
    inp, maxx, maxy, x, y, prev, first: char;
    max: integer;
begin
    writeln('Zvonov Andrey, 110 group, task 9.32');
    writeln('Enter your sequence:');
    prev := ',';
    read(inp);
    for x := 'a' to 'z' do
        for y := 'a' to 'z' do pairs[x, y] := 0;
    while inp <> '.' do begin
        if prev = ',' then first := inp else
            if inp = ',' then begin
                pairs[first, prev] := pairs[first, prev] + 1;
            end;
        prev := inp;
        read(inp);
    end;
    max := 0;
    for x := 'a' to 'z' do
        for y := 'a' to 'z' do
            if max < pairs[x, y] then begin
                max := pairs[x, y];
                maxx := x;
                maxy := y;
            end;
    writeln('Maximum is: ', maxx, ' and ', maxy);
end.
