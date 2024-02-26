program task623g(input, output);
var
  inp : char;
  prevp : boolean;
begin
  writeln('Zvonov Andrey, 110 group, task 6.23g');
  writeln('Enter your sequence: ');
  read(inp);
  prevp := false;
  while inp <> '.' do begin
    if prevp and (inp = 'h') then begin write('f'); prevp := false; end else
      if prevp and (inp = 'p') then write('p') else
        if prevp and (inp <> 'h') then write('p', inp) else
          if inp <> 'p' then write(inp);
    prevp := false;
    if inp = 'p' then prevp := true;
    read(inp);
  end;
  if prevp then write('p');
end.
