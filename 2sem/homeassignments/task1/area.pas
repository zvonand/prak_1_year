program area(input, output);

const
    eps = 0.001;

type
    func = function(x: real): real;

var
    x12, x23, x13, ar: real;

function F1(x: real): real;
begin
    F1 := 3 / (sqr(x - 1) + 1);
end;

function F1d(x: real): real;
begin
    F1d := (-6 * (x - 1))/sqr(sqr(x) - 2*x + 2);
end;

function F2(x: real): real;
begin
    F2 := sqrt(x + 0.5);
end;

function F2d(x: real): real;
begin
    F2d := 0.5 / sqrt(x + 0.5);
end;

function F3(x: real): real;
begin
    F3 := exp( -1 * x);
end;

function F3d(x: real): real;
begin
    F3d := -1 * exp(-1 * x);
end;

function Diff(f, g: func; x: real): real;
begin
    Diff := f(x) - g(x);
end;

procedure Root(f, g, fd, gd: func; a, b, eps1: real; var x: real);
var
    cas, condition: boolean;
    c, d, e: real;
begin
    condition := true;
    cas := (a < b) = (Diff(f, g, a) < Diff(f, g, b));
    while condition do begin
        c := (a * Diff(f, g, b) - b * Diff(f, g, a))/(Diff(f, g, b) - Diff(f, g, a));
        if cas then
            d := b else
                d := a;
        e := d - Diff(f, g, d)/Diff(fd, gd, d);
        if cas then begin
            a := c;
            b := e;
        end else begin
            b := c;
            a := e;
        end;
        if (a + eps1) > 0 then begin
            condition := false;
            x := a;
        end else if (b - eps1) < 0 then begin
            condition := false;
            x := b;
        end;
    end;
end;

function Simpson(f: func; a, b: real; var carrySum: real; n: integer): real;
var
    h, result, i, temp: real;
begin
    h := (b - a) / n;
    i := a + h;
    result := 0;
    result := result + carrySum * 2;
    while i < b do begin
        temp := f(i);
        result := result + temp;
        carrySum := carrySum + temp;
        i := i + 2 * h;
    end;
    result := result * 2;
    Simpson := h / 3 * (result + f(a) + f(b));
end;

function Integral(f: func; a, b, eps2: real): real;
var
    n: integer;
    s1, s2, carrySum, temp, i, h: real;
begin
    n := 2;
    carrySum := 0;
    h := (b - a) / n;
    i := a + h;
    s2 := 0;
    while i < b do begin
        temp := f(i);
        s2 := s2 + 4 * temp;
        carrySum := carrySum + temp;
        i := i + h;
        temp := f(i);
        s2 := s2 + 2 * temp;
        carrySum := carrySum + temp;
        i := i + h;
    end;
    repeat
        s1 := s2;
        n := n * 2;
        s2 := Simpson(f, a, b, carrySum, n);
    until abs(s2 - s1) < eps2;
    Integral := s2;
end;

begin
    writeln('Zvonov Andrey, 110 group, task 1');
    writeln('9th set, combined, Simpson rule');
    Root(F1, F2, F1d, F2d, 1.8, 2.0, eps / 10, x12);
    Root(F2, F3, F2d, F3d, 0.0, 0.4, eps / 10, x23);
    Root(F1, F3, F1d, F3d, -0.3, -0.1, eps / 10, x13);
    writeln(x13:2:4, ' ', x23:2:4, ' ', x12:2:4, ' ');
    ar := Integral(F1, x13, x12, eps) - Integral(F3, x13, x23, eps) - Integral(F2, x23, x12, eps);
    write('Area is ', ar:0:3);
end.
