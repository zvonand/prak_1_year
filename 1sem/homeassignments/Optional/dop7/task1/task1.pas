{$R+,B+}
program task1(input, output);
var
    fin, fout: text;

procedure redo(var fin, fout: text);
var
    inp: char;
    opened, instr: boolean;
begin
    rewrite(fout);
    opened := false;
    instr := false;
    while not eof(fin) do begin
        while not eoln(fin) do begin
            read(fin, inp);
            if instr and not opened and (inp = '''') then begin write(fout, ''''); instr := false end else
                if not instr and not opened and (inp = '''') then begin write(fout, ''''); instr := true end else
                    if not instr and not opened and (inp = '{') then begin opened := true; write(fout, ' ') end else
                        if not instr and (inp = '}') then opened := false else
                            if not opened then write(fout, inp);
        end;
        readln(fin);
        writeln(fout);
    end;
    close(fin);
    close(fout);
end;


begin
    writeln('Zvonov Andrey, 110 group, optional task 1');
    assign(fin, 'prog.pas');
    assign(fout, 'prog1.pas');
    reset(fin);
    redo(fin, fout);
end.
