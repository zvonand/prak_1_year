include console.inc
.data
        D dq 10 dup(0)
        Buff dq ?
.code
    Start:
        ConsoleTitle 'Zvonov Andrey, 110 group, optional task 2'
        outstrln 'Enter the numbers: '
        sub EDI, EDI;                   This will be pointer for D array, now set to zero
        mov ESI, 10;                    10-multiplier
        mov CL, '0'

outer:  cmp CL, '.'
        je fin
        inchar CL
        mov dword ptr Buff, 0
        mov dword ptr Buff + 4, 0;      Buff := 0

inner:  cmp CL, ','
        je infin
        cmp CL, '.'
        je infin
        cmp CL, '9'
        jg err
        cmp CL, '0'
        jl err

        sub CL, '0';                    CL now contains a number
        movzx ECX, CL

        mov EAX, dword ptr D[8*EDI];
        mul ESI

        mov EBX, EAX
        mov EBP, EDX

        mov EAX, dword ptr D[8*EDI + 4]
        mul ESI
        cmp EDX, 0
        jne err
        add EBX, ECX
        adc EBP, EAX
        jc err
        mov dword ptr D[8*EDI], EBX
        mov dword ptr D[8*EDI + 4], EBP
        inchar CL
        jmp inner

infin:  outwordln D[8*EDI]
        inc EDI
        jmp outer


err:    outstrln 'Input error'
fin:   pause 'Press any key to terminate'

    exit
    end Start
