program flags(input, output);
type
    flag = (carry, overflow, sign, zero);
    str = array[1..32] of integer;
var
    i, k: integer;
    lower, upper: int64;
    nums: array[1..2] of int64;
    bins: array[1..2] of str;
    sumflag: array[flag] of int64;
    continue: boolean;
    cont: char;

function unsigned(inp: int64): int64;
begin
    if inp < 0 then
        unsigned := upper + 1 - abs(inp)
    else
        unsigned := inp;
end;

function signed(inp: int64): int64;
var
    uns: int64;
begin
    uns := unsigned(inp);
    if inp < abs(lower) then
        signed := inp
    else
        signed := uns - upper - 1;
end;

function ToBinary(var inp: int64): str;
var
    j: integer;
    temp: int64;
    result, res: str;
begin
    temp := inp;
    if temp < 0 then
        temp := upper + 1 - abs(temp);
    for j := 1 to k do begin
        result[j] := temp mod 2;
        temp := temp div 2;
    end;
    for j := 1 to k do
        res[j] := result[k - j + 1];
    ToBinary := res;
end;

procedure ReadInput;
begin
    writeln('Enter cell size (2 to 32): ');
    read(k);
    while (k < 2) or (k > 32) do begin
        writeln('Entered invalid size, enter a valid size(2 to 32):');
        read(k);
    end;

    lower := -1 * round(exp((k - 1) * ln(2)));
    upper := round(exp(k * ln(2))) - 1;
    writeln('Range of possible numbers is [', lower, '..', upper, ']');
    writeln('Enter 2 integer numbers: ');
    read(nums[1], nums[2]);

    while (nums[1] > upper) or (nums[2] > upper) or (nums[1] < lower) or (nums[2] < lower) do begin
        writeln('Invalid numbers, enter again:');
        read(nums[1], nums[2]);
    end;
end;

procedure FormTable;
var
    i: integer;
begin
    writeln(' ': 16, 'In binary':k, ' nosign':k, ' signed':k);
    write('First number: ': 16);
    for i := 1 to k do write(bins[1][i]);
    write(' ', unsigned(nums[1]):k, ' ', signed(nums[1]):k);
    writeln();
    write('Second number: ': 16);
    for i := 1 to k do write(bins[2][i]);
    write(' ', unsigned(nums[2]):k, ' ', signed(nums[2]):k);
    writeln();
    writeln();
end;

procedure BinarySum(n1, n2: str);
var
    i: integer;
    t: array[1..2] of int64;
    unsSum, sgnSum, init: int64;
    result: str;
    uns, sig: boolean;
begin
    sumflag[carry] := 0;
    for i := k downto 1 do begin
        result[i] := (n1[i] + n2[i] + sumflag[carry]) mod 2;
        if ((n1[i] * n2[i]) = 1) or ((n1[i] * sumflag[carry]) = 1) or ((sumflag[carry] * n2[i]) = 1) then
            sumflag[carry] := 1 else
                sumflag[carry] := 0;
    end;

    sumflag[sign] := result[1];
    sumflag[zero] := 1;
    for i := 1 to k do
        if result[i] <> 0 then
            sumflag[zero] := 0;
    if ((abs(n1[1] - 1) * abs(n2[1] - 1) * result[1]) = 1) or ((n1[1] * n2[1] * abs(result[1] - 1)) = 1) then
        sumflag[overflow] := 1 else
            sumflag[overflow] := 0;

    unsSum := 0;
    sgnSum := 0;
    init := 1;
    for i := 1 to k do begin
        unsSum := unsSum + result[k + 1 - i] * init;
        init := init * 2;
    end;
    init := 1;
    for i := 1 to (k - 1) do begin
        sgnSum := sgnSum + result[k + 1 - i] * init;
        init := init * 2;
    end;
    if result[1] = 1 then
        sgnSum := -1 * (init - sgnSum);

    t := nums;
    for i := 1 to 2 do
        if t[i] < 0 then
            t[i] := upper + 1 - abs(t[i]);
    if (t[1] + t[2]) = unsSum then
        uns := true else
            uns := false;
    t := nums;
    for i := 1 to 2 do
        if t[i] >= abs(lower) then
            t[i] := t[i] - upper - 1;
    if (t[1] + t[2]) = sgnSum then
        sig := true else
            sig := false;

    for i := 1 to k do write(result[i]);
    write(' ', unsSum: 2 * k, uns: 6, ' ', sgnSum: 2 * k, sig: 6, ' ', sumflag[carry]:3, ' ', sumflag[overflow]:3, ' ', sumflag[sign]:3, ' ', sumflag[zero]:3);
end;

procedure BinarySubtr(n1, n2: str);
var
    i: integer;
    t: array[1..2] of int64;
    unsSum, sgnSum, init: int64;
    result: str;
    uns, sig: boolean;
begin
    sumflag[carry] := 0;
    for i := k downto 1 do begin
        result[i] := (n1[i] + n2[i] + sumflag[carry]) mod 2;
        if ((n2[i] * sumflag[carry]) = 1) or ((result[i] * sumflag[carry]) = 1) or ((n2[i] * result[i]) = 1) then
            sumflag[carry] := 1 else
                sumflag[carry] := 0;
    end;
    sumflag[sign] := result[1];
    sumflag[zero] := 1;
    for i := 1 to k do
        if result[i] <> 0 then
            sumflag[zero] := 0;
    if ((abs(n1[1] - 1) * n2[1] * result[1]) = 1) or ((n1[1] * abs(n2[1] - 1) * abs(result[1] - 1)) = 1) then
        sumflag[overflow] := 1 else
            sumflag[overflow] := 0;

    unsSum := 0;
    sgnSum := 0;
    init := 1;
    for i := 1 to k do begin
        unsSum := unsSum + result[k + 1 - i] * init;
        init := init * 2;
    end;
    init := 1;
    for i := 1 to (k - 1) do begin
        sgnSum := sgnSum + result[k + 1 - i] * init;
        init := init * 2;
    end;

    if result[1] = 1 then
        sgnSum := -1 * (init - sgnSum);
    t := nums;
    for i := 1 to 2 do
        if t[i] < 0 then
            t[i] := upper + 1 - abs(t[i]);
    if (t[1] - t[2]) = unsSum then
        uns := true else
            uns := false;
    t := nums;
    for i := 1 to 2 do
        if t[i] >= abs(lower) then
            t[i] := t[i] - upper - 1;
    if (t[1] - t[2]) = sgnSum then
        sig := true else
            sig := false;

    for i := 1 to k do write(result[i]);
    write(' ', unsSum: 2 * k, uns: 6, ' ', sgnSum: 2 * k, sig: 6, ' ', sumflag[carry]:3, ' ', sumflag[overflow]:3, ' ', sumflag[sign]:3, ' ', sumflag[zero]:3);
end;

procedure Execute;
begin
    ReadInput;
    for i := 1 to 2 do
        bins[i] := ToBinary(nums[i]);
    FormTable;
    write(' ': k, 'Binary ': k, 'No sign ': (2 * k + 7), 'Signed ':(2 * k + 7), 'CF':4, 'OF':4, 'SF':4, 'ZF':4);
    writeln();
    write('Sum: ': k);
    BinarySum(bins[1], bins[2]);
    writeln();
    write('Diff: ': k);
    BinarySubtr(bins[1], bins[2]);
    writeln();
    writeln();
    writeln('Do you want to continue? (Y or N)');
    repeat
        read(cont)
    until (cont = 'Y') or (cont = 'N');

    if cont = 'N' then
        continue := false;
end;

begin
    writeln('Zvonov Andrey, 110 group, task2');
    continue := true;
    while continue do
        Execute;
end.
