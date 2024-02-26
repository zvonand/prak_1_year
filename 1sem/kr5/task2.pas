program task2(input, output);
const
    N = 5;
var
    fin: text;
    k: integer;
    res: boolean;

function Equal(var fin: text; k: integer): boolean;
var
    i, j, inp, sumhoriz, sumvert: integer;

begin
    sumhoriz := 0;
    sumvert := 0;
    for i := 1 to (k - 1) do begin
        for j := 1 to k do
            read(fin, inp);
        sumvert := sumvert + inp;
        readln(fin);
    end;
    for i := 1 to N do begin
        read(fin, inp);
        sumhoriz := sumhoriz + inp;
        if i = k then
            sumvert := sumvert + inp;
    end;
    readln(fin);
    for i := (k + 1) to N do begin
        for j := 1 to k do
            read(fin, inp);
        sumvert := sumvert + inp;
        readln(fin);
    end;
    writeln('Horizontal: ', sumhoriz);
    writeln('Vertical: ', sumvert);
    Equal := (sumhoriz = sumvert);
end;

begin
    assign(fin, 'matrix.txt');
    reset(fin);
    writeln('Enter k:');
    read(k);
    res := Equal(fin, k);
    writeln(res);
end.
