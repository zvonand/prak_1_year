include console.inc

.data
        P dd ?
        Q dd ?
.code
    Start:
        ConsoleTitle 'Zvonov Andrey, 110 group, task4'
        inintln P, 'Enter P: '
        inintln Q, 'Enter Q: '
        mov EAX, P
        sub EDX, EDX
        mov EBX, Q
        div EBX
        outword EAX
        outchar '.'
        sub ESI, ESI;       Counter variable
        inc ESI;            Set counter to 1

cycle:  cmp ESI, 5;         Main cycle
        ja term
        mov EAX, EDX;
        sub EDX, EDX;       EDX := 0
        mov ECX, 10
        mul ECX;            mod := mod * 10

        div EBX
        outint EAX
        inc ESI
        jmp cycle


term:   outcharln ' '
        pause 'Press any key to terminate'

        exit
    end Start
