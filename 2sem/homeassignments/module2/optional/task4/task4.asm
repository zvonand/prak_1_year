include console.inc
.data
        N equ 39
        D dq 2 dup(0)
        Ans db N dup('0'), 0
        Res dq 2 dup(0)
.code
;input procedure - taken from task 1
    inp proc
    .data
        Buff dq ?
    .code
        sub EDI, EDI;                   This will be pointer for D array, now set to zero
        mov ESI, 10;                    10-multiplier
        mov CL, '0'

@outer: cmp CL, '.'
        je @fin
        inchar CL
        mov dword ptr Buff, 0
        mov dword ptr Buff + 4, 0;      Buff := 0

@inner: cmp CL, ','
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
        jmp @inner

@infin: inc EDI
        jmp @outer
@fin:   ret
        inp endp




    Start:
        ConsoleTitle 'Zvonov Andrey, 110 group, optional task 4'
        mov ESI, 10;        Divisor, needed in future
        call inp
        mov EAX, dword ptr D
        mov EBX, dword ptr D+8
        mul EBX
        add dword ptr Res + 12, EDX
        add dword ptr Res + 8, EAX
        mov EAX, dword ptr D+4
        mul EBX
        add dword ptr Res + 8, EDX
        adc dword ptr Res + 4, EAX
        mov EAX, dword ptr D+4
        mov EBX, dword ptr D+12
        mul EBX
        add dword ptr Res + 8, EDX
        adc dword ptr Res + 4, EAX
        mov EAX, dword ptr D + 4
        mul EBX
        add dword ptr Res + 8, EDX
        adc dword ptr Res + 12, EAX
        ;outword Res
        ;outwordln Res + 8
        ;number is stored in Res
        ;mult s alright, todo: output
        mov EDI, N-1
cycle:  cmp dword ptr Res, 0
        jne strt
        cmp dword ptr Res + 4, 0
        jne strt
        cmp dword ptr Res + 8, 0
        jne strt
        cmp dword ptr Res + 12, 0
        jne strt
        jmp tavoite
strt:   sub EDX, EDX
        mov EAX, dword ptr Res + 4
        div ESI
        mov dword ptr Res + 4, EAX
        mov EAX, dword ptr Res
        div ESI
        mov dword ptr Res, EAX
        mov EAX, dword ptr Res + 12
        div ESI
        mov dword ptr Res + 12, EAX
        mov EAX, dword ptr Res + 8
        div ESI
        mov dword ptr Res + 8, EAX
        add DL, '0'
        mov Ans[EDI], DL
        dec EDI
        jmp cycle


tavoite:inc EDI
        lea EDI, Ans[EDI]
        outstrln EDI
        jmp fin
err:   outstrln 'Input error'
fin:   pause 'Press any key to terminate'

    exit
    end Start
