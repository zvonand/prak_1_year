include console.inc
.data
        N EQU 30
        X dd N dup (?)
.code
    Start:
        ConsoleTitle 'Zvonov Andrey, 110 group, obligatory task 5'

        inint ESI, 'Enter number of elements: '
        mov EBX, ESI
        mov ECX, 0

inp:    cmp ECX, ESI
        je ou
        inint X[4 * ECX]
        inc ECX
        jmp inp

ou:     ;pass
        mov ECX, ESI
        dec ECX
outer:  cmp ECX, 0
        je fin
        mov EAX, 0
        mov EDI, 0

inner:  cmp EAX, ECX
        je infin
        mov EBX, X[4*EAX];      inner cycle counter
        mov EDX, X[4*ECX];      outer cycle counter
        cmp EBX, EDX
        jle no
        mov X[4*EAX], EDX
        mov X[4*ECX], EBX
        mov EDI, 1

no:     inc EAX
        jmp inner

infin:  cmp EDI, 0
        dec ECX
        jmp outer

fin:    mov ECX, 0

output: cmp ECX, ESI
        je term
        outint X[4 * ECX]
        outchar ' '
        inc ECX
        jmp output

term:   outcharln ' '
        pause 'Press any key to terminate'


    exit
    end Start
