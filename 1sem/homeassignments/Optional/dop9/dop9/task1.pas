{$R+,B+}
program task4(input, output);
type
    marray = array [1..5] of 2..5;
    str = packed array [1..10] of char;
    stud = record
        fn: record fam, name : str; end;
        sex : (M, W);
        marks : marray;
    end;
    FS = file of stud;
    tree = ^student;
    student = record
        data: stud;
        left, right: tree;
    end;

var studtree, newstud: tree;
    fin: FS;
    fout: text;
    j: integer;
    toprint: boolean;

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


function CheckStudent(student: tree) : boolean;
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

procedure AddStudent(var top, newstud: tree);
begin
    if top <> nil then begin
    if top^.data.fn.fam < newstud^.data.fn.fam then
        AddStudent(top^.right, newstud)
    else
        if top^.data.fn.fam > newstud^.data.fn.fam then
            AddStudent(top^.left, newstud)
  end else begin
    new(top);
    top^.data := newstud^.data;
    top^.left := nil;
    top^.right := nil;
  end
end;

procedure PrintTree(root: tree);
begin
    if (root^.left = nil) and (root^.right = nil) then begin
        with root^.data do begin
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
    end else begin
        if not (root^.left = nil) then
            PrintTree(root^.left);
        with root^.data do begin
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
        if not (root^.right = nil) then
            PrintTree(root^.right);

    end;
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
    newstud^.right := nil;
    newstud^.left := nil;
    studtree := nil;
    while not eof(fin) do begin
        read(fin, newstud^.data);
        toprint := CheckStudent(newstud);
        if toprint then 
            AddStudent(studtree, newstud);
    end;
    PrintTree(studtree);
    close(fin);
    close(fout);
end.
