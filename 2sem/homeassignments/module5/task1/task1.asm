include console.inc
.code
    Start:
        ConsoleTitle 'Zvonov Andrey, 110 group, task 1'
        outstr 'Enter the binary 32-bit number: '
        xor EAX, EAX
        xor EDX, EDX;       number length counter
        inchar CL

incyc:  cmp CL, ' '
        je infin
        shl EAX, 1
        sub CL, '0'
        add AL, CL
        inchar CL
        inc EDX
        jmp incyc

infin:  mov CL, 32
        sub CL, DL
        shl EAX, CL
        xor DH, DH

outcyc: cmp DH, DL
        je fin
        xor EDI, EDI
        shl EAX, 1
        adc EDI, 0
        outword EDI
        inc DH
        jmp outcyc


fin:    newline
        pause 'Press any key to terminate'

        exit
    end Start
