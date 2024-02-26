include console.inc
.data
        Symm db 'Symmetric', 0
        Nsym db 'Non-symmetric', 0
.code
    Start:
        ;See algorithm brief description in alg.txt
        ConsoleTitle 'Zvonov Andrey, 110 group, task 3'
        outstrln 'Enter a 32-digit binary number: '
        xor EAX, EAX
        xor EDX, EDX;       number length counter
;1111 1111 1111 1111 1111 1111 1111 1111
incyc:  cmp EDX, 32
        je infin
        inchar CL
        cmp CL, ' '
        je incyc
        shl EAX, 1
        sub CL, '0'
        add AL, CL
        inc EDX
        jmp incyc

infin:  ;input finished
        mov EDI, EAX;       this EAX copy will be SHL'd
        mov ESI, EAX;       this EAX copy will be SHR'd
        xor DL, DL

chkcyc: cmp DL, 16
        je symm
        xor DH, DH;             carryflag check
        shl EDI, 1
        adc DH, 0
        shr ESI, 1
        adc DH, 0
        cmp DH, 1
        je nosymm
        inc DL
        jmp chkcyc

symm:   outstrln offset Symm
        and EAX, 0FFFE7FFFh
        jmp outp

nosymm: outstrln offset Nsym
        mov EDI, EAX
        mov ESI, EAX
        and EDI, 80000000h
        and ESI, 1h
        and EAX, 7FFFFFFEh
        shr EDI, 31
        shl ESI, 31
        or EAX, EDI
        or EAX, ESI

outp:   mov DL, 1
outcyc: cmp DL, 32
        ja term
        xor BL, BL
        shl EAX, 1
        adc BL, 0
        outword BL
        push EAX
        push EDX
        movzx EAX, DL
        mov ECX, 4
        xor EDX, EDX
        div ECX
        cmp EDX, 0
        jne pp
        outchar ' '
pp:     pop EDX
        pop EAX
        inc DL
        jmp outcyc

term:   newline
        pause 'Press any key to terminate'
        exit
    end Start
