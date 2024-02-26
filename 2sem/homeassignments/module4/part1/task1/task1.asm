include console.inc
.data
        N equ 100
        S db N dup(?)
.code
    ReadText Proc
    .code
        push EBP
        mov EBP, ESP;       Saved old ESP in EBP
        push ECX
        push EBX
        xor EAX, EAX
        mov ECX, dword ptr [EBP + 8]
        inchar BL, 'Enter the text: '
@incyc: cmp BL, '.'
        je @fin
        inc EAX
        mov byte ptr [ECX], BL
        inc ECX
        inchar BL
        jmp @incyc

@fin:   pop EBX
        pop ECX
        pop EBP
        ret 4*1
    ReadText endp

    MaxLet Proc
    .code
        push EBP
        mov EBP, ESP
        sub ESP, 28
        ;recover all used registers
        push EBX
        push ECX
        push EDI
        push EDX
        push ESI

        mov ESI, dword ptr [EBP + 8];       array pointer in ESI
        mov EDI, dword ptr [EBP + 12];      array length in EDI
        xor ECX, ECX
        mov EBX, EBP
        sub EBX, 28

@nul:   cmp ECX, 28
        je @fnul
        mov byte ptr [EBX][ECX], 0
        inc ECX
        jmp @nul
        ;now local array contains zeros, stage 1 completed
@fnul:  xor ECX, ECX

@corr:  cmp ECX, EDI
        je @cfin
        mov DL, byte ptr [ESI][ECX]
        sub DL, 'a'
        movzx EDX, DL
        inc byte ptr [EBX][EDX];     to fix smth here
        inc ECX
        jmp @corr
        ;implemented helper array

@cfin:  xor EDI, EDI;       a counter to go through helper array
        xor EAX, EAX;       storage for maxElemIndex
        xor ECX, ECX;       storage for maxElem


@chk:   cmp EDI, 26
        je @chkfin
        cmp byte ptr [EBX][EDI], CL
        jna @na
        mov CL, byte ptr [EBX][EDI]
        mov EAX, EDI
@na:    inc EDI
        jmp @chk

@chkfin:add EAX, 'a'

        pop ESI
        pop EDX
        pop EDI
        pop ECX
        pop EBX
        mov ESP, EBP
        pop EBP
        ret 4*2
    MaxLet endp


    Start:
        ConsoleTitle 'Zvonov Andrey, 110 group, task1'
        push offset S
        call ReadText
        push EAX
        push offset S
        call MaxLet
        outcharln AL
        pause 'Press any key to terminate'

        exit
    end Start
