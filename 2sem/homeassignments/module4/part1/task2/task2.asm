include console.inc
.data
        MaxSize equ 150
        n db ?
        m db ?
        X dw MaxSize dup(?)
.code
    Print Proc
    .code
        push EBP
        mov EBP, ESP
        push EAX
        push EBX
        push ECX
        push EDX
        push ESI
        push EDI

        mov EBX, dword ptr [EBP + 8];       X array offset
        mov ECX, dword ptr [EBP + 12];      number of columns
        mov EDX, dword ptr [EBP + 16];      number of rows

        xor EAX, EAX
        mov ESI, EBX

@ou:    cmp EAX, EDX
        je @cfin
        xor EDI, EDI
@inn:   cmp EDI, ECX
        je @infin
        outint word ptr [ESI][2*EDI]
        outchar ' '
        inc EDI
        jmp @inn
@infin: outcharln ' '
        add ESI, ECX
        add ESI, ECX
        inc EAX
        jmp @ou

@cfin:  pop EDI
        pop ESI
        pop EDX
        pop ECX
        pop EBX
        pop EAX
        mov ESP, EBP
        pop EBP
        ret 4*3
    Print endp


    Sorted Proc
    .code
        push EBP
        mov EBP, ESP
        push EAX
        push EBX
        push ECX
        push EDX
        push ESI
        push EDI
        outstr 'Numbers of sorted rows: '

        mov EBX, dword ptr [EBP + 8];       X array offset
        mov ECX, dword ptr [EBP + 12];      number of columns
        mov EDI, dword ptr [EBP + 16];      number of rows
        xor ESI, ESI

@ou:    cmp ESI, EDI
        je @done
        push EDI
        lea EDI, [2*ESI]
        mov EAX, ECX
        mul EDI
        add EAX, EBX
        mov EDI, EAX
        push ESI
        push EBX
        mov ESI, 1

@inn:   cmp ESI, ECX
        je @infin
        mov BX, word ptr [EDI][2*ESI]
        cmp word ptr [EDI][2*ESI - 2], BX
        jg @ns
        inc ESI
        jmp @inn

@ns:    pop EBX
        pop ESI
        pop EDI
        inc ESI
        jmp @ou

@infin: pop EBX
        pop ESI
        pop EDI
        inc ESI
        outword ESI
        outchar ' '
        jmp @ou


@done:  newline
        pop EDI
        pop ESI
        pop EDX
        pop ECX
        pop EBX
        pop EAX
        mov ESP, EBP
        pop EBP
    ret 4*3
    Sorted endp

    SymRow Proc
    .code
        push EBP
        mov EBP, ESP
        sub ESP, 4
        push EAX
        push EBX
        push ECX
        push EDX
        push ESI
        push EDI
        outstr 'Numbers of symmetric rows: '

        mov EBX, dword ptr [EBP + 8];       X array offset
        mov ECX, dword ptr [EBP + 12];      number of columns
        mov EDI, dword ptr [EBP + 16];      number of rows
        lea ESI, [2*ECX - 2]
        mov dword ptr [EBP - 4], ESI
        xor ESI, ESI

@ou:    cmp ESI, EDI
        je @done
        push EDI
        lea EDI, [2*ESI]
        mov EAX, ECX
        mul EDI
        add EAX, EBX
        mov EDI, EAX
        push ESI
        push EBX
        push ECX
        push EDX
        xor ESI, ESI
        mov EAX, ECX
        mov ECX, 2
        xor EDX, EDX
        div ECX
        mov ECX, EAX
        dec ECX
        add ECX, EDX

@inn:   cmp ESI, ECX
        je @infin
        push ESI
        lea ESI, [2*ESI]
        mov EDX, dword ptr [EBP - 4]
        lea EBX, [EDI][EDX]
        sub EBX, ESI
        mov BX, word ptr [EBX]
        cmp BX, word ptr [EDI][ESI]
        pop ESI
        jne @ns
        inc ESI
        jmp @inn

@ns:    pop EDX
        pop ECX
        pop EBX
        pop ESI
        pop EDI
        inc ESI
        jmp @ou

@infin: pop EDX
        pop ECX
        pop EBX
        pop ESI
        pop EDI
        inc ESI
        outword ESI
        outchar ' '
        jmp @ou


@done:  newline
        pop EDI
        pop ESI
        pop EDX
        pop ECX
        pop EBX
        pop EAX
        mov ESP, EBP
        pop EBP
    ret 4*3
    SymRow endp



    Same Proc
    .code
        push EBP
        mov EBP, ESP
        sub ESP, 4
        push EAX
        push EBX
        push ECX
        push EDX
        push ESI
        push EDI
        outstr 'Numbers of columns where all elems are equal: '

        mov EBX, dword ptr [EBP + 8];       X array offset
        mov ECX, dword ptr [EBP + 12];      number of columns
        mov EDI, dword ptr [EBP + 16];      number of rows
        lea EAX, [2*ECX]
        mov dword ptr [EBP - 4], EAX;       offset difference for same elems in neighbour rows
        xor ESI, ESI

@ou:    cmp ESI, ECX
        je @done
        push ESI
        lea ESI, [EBX][2*ESI]
        mov EAX, 1
        add ESI, dword ptr [EBP - 4]
@inn:   cmp EAX, EDI
        je @same
        mov DX, word ptr [ESI]
        sub ESI, dword ptr [EBP - 4]
        cmp word ptr [ESI], DX
        jne @ns
        inc EAX
        add ESI, dword ptr [EBP - 4]
        jmp @inn

@same:  pop ESI
        inc ESI
        outword ESI
        outchar ' '
        jmp @ou

@ns:    pop ESI
        inc ESI
        jmp @ou

@done:  newline
        pop EDI
        pop ESI
        pop EDX
        pop ECX
        pop EBX
        pop EAX
        mov ESP, EBP
        pop EBP
    ret 4*3
    Same endp


    Mdiag Proc
    .code
        push EBP
        mov EBP, ESP
        sub ESP, 4
        push EAX
        push EBX
        push ECX
        push EDX
        push ESI
        push EDI
        outstr 'Main diagonal elements: '

        mov EBX, dword ptr [EBP + 8];       X array offset
        mov ECX, dword ptr [EBP + 12];      number of columns
        mov EDI, dword ptr [EBP + 16];      number of rows

        lea EAX, [2*ECX + 2]
        mov dword ptr [EBP - 4], EAX;       offset difference for 2 main diag elems

        xor ESI, ESI

@ou:    cmp ESI, ECX
        je @done
        outint word ptr [EBX]
        outchar ' '
        add EBX, dword ptr [EBP - 4]

        inc ESI
        jmp @ou

@done:  newline
        pop EDI
        pop ESI
        pop EDX
        pop ECX
        pop EBX
        pop EAX
        mov ESP, EBP
        pop EBP
    ret 4*3
    Mdiag endp

    Adiag Proc
    .code
        push EBP
        mov EBP, ESP
        sub ESP, 4
        push EAX
        push EBX
        push ECX
        push EDX
        push ESI
        push EDI
        outstr 'Antidiagonal elements: '

        mov EBX, dword ptr [EBP + 8];       X array offset
        mov ECX, dword ptr [EBP + 12];      number of columns
        mov EDI, dword ptr [EBP + 16];      number of rows

        lea EAX, [2*ECX - 2]
        mov dword ptr [EBP - 4], EAX;       offset difference for 2 main diag elems

        lea EBX, dword ptr [EBX][2*ECX - 2]
        xor ESI, ESI
        
@ou:    cmp ESI, ECX
        je @done
        outint word ptr [EBX]
        outchar ' '
        add EBX, dword ptr [EBP - 4]
        inc ESI
        jmp @ou

@done:  newline
        pop EDI
        pop ESI
        pop EDX
        pop ECX
        pop EBX
        pop EAX
        mov ESP, EBP
        pop EBP
    ret 4*3
    Adiag endp



    Start:
        ConsoleTitle 'Zvonov Andrey, 110 group, task2'
strt:   inintln n, 'Enter number of rows: '
        inintln m, 'Enter number of columns: '
        mov AL, n
        mov BL, m
        mul BL
        cmp AX, MaxSize
        jbe selva
        inchar CL, 'Wrong input, want to repeat? (y/n): '
        cmp CL, 'y'
        je strt
        jmp term

selva:  xor ECX, ECX

inp:    cmp CL, n
        je inpfin
        xor EBX, EBX
        movzx EAX, CL
        mul m
        add EAX, EAX
incyc:  cmp BL, m
        je finin
        movzx EBX, BL
        inint X[EAX][2*EBX]
        inc BL
        jmp incyc

finin:  inc CL
        jmp inp
inpfin: flush
        outcharln ' '
        ;the matrix is now read
        movzx EAX, n
        movzx EBX, m
        lea ECX, X

        push EAX
        push EBX
        push ECX
        call Print

        push EAX
        push EBX
        push ECX
        call Sorted

        push EAX
        push EBX
        push ECX
        call SymRow

        push EAX
        push EBX
        push ECX
        call Same

        cmp EAX, EBX
        jne term

        push EAX
        push EBX
        push ECX
        call Mdiag

        push EAX
        push EBX
        push ECX
        call Adiag

term:   inchar CL, 'Do you want to enter another matrix? (y/n) '
        cmp CL, 'y'
        je strt
        pause 'Press any key to terminate'

        exit
    end Start
