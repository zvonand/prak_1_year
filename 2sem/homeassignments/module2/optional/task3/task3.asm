include console.inc
.data
        D dq 3 dup(0)
.code
;input procedure - taken from task 1
    inp proc
    .data
        Buff dq ?
    .code
        sub EDI, EDI;                   This will be pointer for D array, now set to zero
        mov ESI, 10;                    10-multiplier
        mov CL, '0'

outer:  cmp CL, '.'
        je @fin
        inchar CL
        mov dword ptr Buff, 0
        mov dword ptr Buff + 4, 0;      Buff := 0

inner:  cmp CL, ','
        je @infin
        cmp CL, '.'
        je @infin
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

@infin: inc EDI
        jmp outer
@fin:   ret
        inp endp


;comp procedure compares 2 elements of D array, whose indices are EDI and ESI, and sorts it (non-decreasing)
    comp proc
    .code
        dec EDI
        dec ESI
        mov EAX, dword ptr D[8*EDI]
        mov EBX, dword ptr D+4[8*EDI]
        mov ECX, dword ptr D[8*ESI]
        mov EDX, dword ptr D+4[8*ESI]
        sub ECX, EAX
        sbb EDX, EBX
        jnc @F
        mov ECX, dword ptr D[8*ESI]
        mov EDX, dword ptr D+4[8*ESI]
        xchg EAX, ECX
        xchg EBX, EDX
        mov dword ptr D[8*EDI], EAX
        mov dword ptr D+4[8*EDI], EBX
        mov dword ptr D[8*ESI], ECX
        mov dword ptr D+4[8*ESI], EDX
@@:   ret
    comp endp

    Start:
        ConsoleTitle 'Zvonov Andrey, 110 group, optional task 3'
        outstrln 'Enter 3 numbers: '

        call inp
        ;compare 1st and 2nd, thus EDI set to 1, ESI - to 2
        mov EDI, 1
        mov ESI, 2
        call comp

        ;compare 1st and 3rd, thus EDI set to 1, ESI - to 3
        mov EDI, 1
        mov ESI, 3
        call comp
        ;compare 2nd and 3rd, thus EDI set to 2, ESI - to 3
        mov EDI, 2
        mov ESI, 3
        call comp

        outword D
        outstr ', '
        outword D+8
        outstr ', '
        outwordln D+16

        jmp fin
err:    outstrln 'Input error'
fin:   pause 'Press any key to terminate'

    exit
    end Start
