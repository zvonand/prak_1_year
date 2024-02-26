include console.inc

.code
    Start:
        ConsoleTitle 'Zvonov Andrey, 110 group, task2'

        mov ECX, 2;     the counter
        mov EAX, 2;     the factorial
        sub EDX, EDX

cycle:  cmp EDX, 0
        jne found
        inc ECX
        mul ECX
        jmp cycle

found:  div ECX
        dec ECX

        outwordln EAX
        outwordln ECX

        pause 'Press any key to terminate'

        exit
    end Start
