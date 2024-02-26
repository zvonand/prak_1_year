program task3(input, output);
type
    wordpoint = ^word;
    word = record
        letter: char;
        next: wordpoint;
    end;
    wordheadpoint = ^wordhead;
    wordhead = record
        currword: wordpoint;
        next: wordheadpoint;
    end;

var
    fin: text;
    wh: wordheadpoint;

begin
    assign(fin, 'words.txt');
    reset(fin);
    wh := nil;
    while not eof(fin) do begin
        if wh = nil then begin
            new(wh);
            
        end;
    end;
end.
