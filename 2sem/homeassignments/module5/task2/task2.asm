include console.inc
.data
        dig db '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'
        hmask dd 0F0000000h
.code
    Start:
        ConsoleTitle 'Zvonov Andrey, 110 group, task 2'
        ;we know toInt('A') > toInt('9')
        xor EAX, EAX
        outstr 'Enter a hexadecimal number: '
        inchar CL
        xor EBX, EBX;       counter for length

incyc:  cmp CL, ' '
        je infin
        shl EAX, 4
        cmp CL, '9'
        ja let

        ;here we see it is a digit 0-9
        sub CL, '0'
        jmp cfn

let:    sub CL, 'A'
        add CL, 10

cfn:    add AL, CL
        inchar CL
        inc EBX
        jmp incyc

infin:  ;input now finished
        mov ECX, 8
        sub ECX, EBX
        lea ECX, [4*ECX];       ECX now not much then 32
        shl EAX, CL
        xor EDX, EDX

outcyc: cmp EDX, EBX
        je term
        mov EDI, EAX
        and EDI, hmask
        shr EDI, 28
        outchar dig[EDI]
        shl EAX, 4
        inc EDX
        jmp outcyc

term:   newline
        pause 'Press any key to terminate'
        exit
    end Start
