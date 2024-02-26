program task545(input, output);
var inp, max1, max2, max3 : integer;
begin
  writeln('Andrey Zvonov, 110 group, task 5.45');
  writeln('Input your numbers: ');
  read(max1, max2, max3, inp);
  while (max1>max2) or (max2>max3) do begin
    if max2>max3 then begin
      max3 := max3+max2;
      max2 := max3-max2;
      max3 := max3-max2;
    end;
    if max1>max2 then begin
      max2 := max2+max1;
      max1 := max2-max1;
      max2 := max2-max1;
    end;
  end;
  while (inp <> 0) do begin
    if inp > max3 then begin
      max1 := max2;
      max2 := max3;
      max3 := inp;
      end else if inp>max2 then begin
        max1 := max2;
        max2 := inp;
      end else if inp>max1 then max1 := inp;
    read(inp);
  end;
  writeln('Here are the 3 largest numbers: ', max1, ' ', max2, ' ', max3);
end.
