program task2(input, output);
const N = 15;
type
    ta = array[0..N] of integer;
var
    init: ta;

procedure inArray(var inp: ta);
var
    x: integer;
begin
    for x := 0 to N do read(inp[x]);
end;

procedure outArray(var out: ta);
var
    x: integer;
begin
    for x := 0 to N do write(out[x], ' ');
end;

function arrayRewriter(var inp, out: ta): integer;
var
    count, x: integer;
begin
    count := 0;
    for x := 0 to N do
        if inp[x] <> 0 then begin
            out[count] := inp[x];
            count := count + 1;
        end;
    arrayRewriter := count;
end;

procedure sortNonZero(var arr: ta);
var
    lim, i, j, temp: integer;
    help: ta;
begin
    lim := arrayRewriter(arr, help);
    for i := 1 to lim do begin
        j := i;
        while (j > 0) and (help[j] < help[j - 1]) do begin
            temp := help[j];
            help[j] := help[j - 1];
            help[j - 1] := temp;
            j := j - 1;
        end;
    end;
    temp := 0;
    for i := 0 to N do
        if arr[i] <> 0 then begin
            arr[i] := help[temp];
            temp := temp + 1;
        end;
end;

begin
    writeln('Enter the array:');
    inArray(init);
    sortNonZero(init);
    outArray(init);
end.
