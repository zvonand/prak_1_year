{$R+,B+}
program task4(input, output);
type
    str = packed array [1..10] of char;
    stud = record
        fn: record fam, name : str; end;
        sex : (M, W);
        marks : array [1..5] of 2..5;
    end;
    FS = file of stud;
    list = ^student;
    student = record
        data : stud;
        next : list;
    end;

var studlist, newstud, i: list;
    fin: FS;
    fout: text;
    j: integer;

procedure Decypher(var finput: FS);
var
    inp: stud;
    out: text;
    i: integer;
begin
    assign(out, 'decyphered.txt');
    rewrite(out);
    while not eof(finput) do begin
        read(finput, inp);
        with inp do begin
            for i := 1 to 10 do
                write(out, fn.fam[i]);
            write(out, ' ');
            for i := 1 to 10 do
                write(out, fn.name[i]);
            write(out, ' ', sex, '     ');
            for i := 1 to 5 do write(out, marks[i], ' ');
        end;
        writeln(out);
    end;
    close(out);
end;


function CheckStudent(student: list) : boolean;
var
    less3, fours : boolean;
    i : integer;
begin
    less3 := false;
    fours := false;
    for i := 1 to 5 do begin
        if student^.data.marks[i] <= 3 then less3 := true;
        if student^.data.marks[i] = 4 then fours := true;
    end;
    CheckStudent := (not less3) and fours;
end;

procedure AddStudent(var student, newstud : list);
var
    i: list;
begin
    if (student = nil) then begin
        new(student);
        student^ := newstud^;
    end else if (student^.data.fn.fam >= newstud^.data.fn.fam) then begin
        new(i);
        i^.next := student;
        student := i;
        i^.data := newstud^.data;
    end else
        AddStudent(student^.next, newstud);
end;

begin
    writeln('Zvonov Andrey, 110 group, task 4');
    assign(fin, 'course.bin');
    assign(fout, 'ans.txt');
    reset(fin);
    Decypher(fin);
    reset(fin);
    rewrite(fout);
    new(newstud);
    newstud^.next := nil;
    studlist := nil;
    while not eof(fin) do begin
        read(fin, newstud^.data);
        if CheckStudent(newstud) then begin
            writeln(newstud^.data.fn.fam);
            AddStudent(studlist, newstud);
        end;
    end;
    while (studlist <> nil) do begin
        with studlist^.data do begin
            with fn do begin
                for j := 1 to 10 do write(fout, fam[j]);
                write(' ');
                for j := 1 to 10 do write(fout, name[j]);
            end;
            write(fout, sex : 2);
            for j := 1 to 5 do
                write(fout, ' ', marks[j]);
            writeln(fout);
        end;
        i := studlist^.next;
        studlist := i;
    end;
    close(fin);
    close(fout);
end.
