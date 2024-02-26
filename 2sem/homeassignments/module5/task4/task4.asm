include console.inc
.data
        L equ 5
        R equ 155
        S db (R-L)/8 + 1 dup(0)
        Incld db 'Included', 0
        Nincl db 'Not included', 0
.code
    Check Proc;   takes 2 parameters: offset and element to check
    .code;      returns 1 if included, 0 otherwise
        push EBP
        mov EBP, ESP
        push EBX
        push ECX
        push EDX
        push EDI
        push ESI

        mov EBX, dword ptr [EBP + 8]
        mov ECX, dword ptr [EBP + 12]
        sub CL, L
        mov CH, 8
        movzx AX, CL
        div CH
        mov CL, AH;             mod now in CL, ready to shift
        movzx EAX, AL;          div
        add EBX, EAX;           required byte offset
        mov DL, 10000000b
        shr DL, CL
        xor EAX, EAX
        test DL, byte ptr [EBX]
        jz @no
        inc EAX
@no:
        pop ESI
        pop EDI
        pop EDX
        pop ECX
        pop EBX
        mov ESP, EBP
        pop EBP
    ret 4*2
    Check endp



    Start:
        ConsoleTitle 'Zvonov Andrey, 110 group, task 4'
strt:
        inchar CL, 'Enter the command: '
        cmp CL, '.'
        je fin

        cmp CL, '+'
        je plus

        cmp CL, '-'
        je minus

        cmp CL, '?'
        je chk

        cmp CL, '='
        je qty

        cmp CL, ':'
        je print

plus:   inint CL
        sub CL, 5
        mov BL, 8
        movzx AX, CL
        div BL
        mov CL, AH;             mod now in CL, ready to shift
        movzx EAX, AL;          div
        mov DL, 10000000b
        shr DL, CL
        or S[EAX], DL
        flush
        jmp strt

minus:  inint CL
        sub CL, 5
        mov BL, 8
        movzx AX, CL
        div BL
        mov CL, AH;             mod now in CL, ready to shift
        movzx EAX, AL;          div
        mov DL, 10000000b
        shr DL, CL
        not DL
        and S[EAX], DL
        flush
        jmp strt

chk:    inint CL
        movzx ECX, CL
        push ECX
        push offset S
        call Check;             made a procedure cause check option will be required later
        mov ESI, offset Nincl
        cmp EAX, 0
        je ouchk
        lea ESI, Incld
ouchk:  outstrln ESI
        flush
        jmp strt

qty:    xor EBX, EBX
        mov ECX, L
qtcyc:  cmp ECX, R
        ja qtcfin
        push ECX
        push offset S
        call Check
        add EBX, EAX
        inc ECX
        jmp qtcyc
qtcfin: outwordln EBX
        flush
        jmp strt

print:  mov ECX, L
prcyc:  cmp ECX, R
        ja prfin
        push ECX
        push offset S
        call Check
        cmp EAX, 0
        je nxt
        outword ECX
        outchar ' '
nxt:    inc ECX
        jmp prcyc
prfin:  newline
        flush
        jmp strt

fin:    newline
        pause 'Press any key to terminate'
        exit
    end Start
