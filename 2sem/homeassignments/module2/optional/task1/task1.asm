include console.inc
.data
        N EQU 20
        D dq 1, 12, 123, 1234, 12345, 123456, 1234567, 123456789123, 1234567891234, 0FFFFFFFFFFFFFFFFh
        Buff dq ?
        Ans db N dup(?), 0
.code
    Start:
        ConsoleTitle 'Zvonov Andrey, 110 group, optional task 1'
        sub ECX, ECX
        mov ESI, 10;                Will be divided by ten

arrcyc: cmp ECX, 10
        je fin
        mov EAX, dword ptr D[8 * ECX]
        mov dword ptr Buff, EAX
        mov EAX, dword ptr D + 4[8 * ECX]
        mov dword ptr Buff + 4, EAX
        lea EDI, Ans + N;                Ans pointer here
        outstr 'By outword: '
        outwordln Buff

divid:  cmp dword ptr Buff, 0;           Comparison if already zero
        jne gtc
        cmp dword ptr Buff+4, 0
        jne gtc
        jmp infin

gtc:    sub EDX, EDX
        mov EAX, dword ptr Buff + 4
        div ESI
        mov dword ptr Buff + 4, EAX
        mov EAX, dword ptr Buff
        div ESI;                        Last digit is now in DL
        mov dword ptr Buff, EAX
        add DL, '0'
        dec EDI
        mov byte ptr [EDI], DL
        jmp divid

infin:  inc ECX
        outstr 'By implemented: '
        outstrln EDI
        outstrln ' '
        jmp arrcyc


fin:
        pause 'Press any key to terminate'

    exit
    end Start
