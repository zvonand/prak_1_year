include console.inc

.data
        S db 'Yes', 0
        Q db 'No ', 0


.code
    Start:
        ConsoleTitle 'Zvonov Andrey, 110 group, task3'
        mov ESI, offset Q

        inintln ECX, 'Enter the number of elememts: '
        sub ECX, 2
        inint EBX
        inint EBP
        sub EDX, EDX
        mov EAX, EBP
        div EBX
        mov EDI, EAX
        mov EBX, EBP

cycle:  cmp ECX, 0
        je fin
        inint EBP
        sub EDX, EDX
        mov EAX, EBP
        div EBX
        cmp EAX, EDI
        jne no
        mov EDI, EAX
        mov EBX, EBP
        sub ECX, 1
        jmp cycle

fin:    mov ESI, offset S
        mul EBP
        outwordln EAX
no:     outstrln ESI


        pause 'Press any key to terminate'

        exit
    end Start
