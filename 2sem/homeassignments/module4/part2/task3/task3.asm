include console.inc
.code
    Outd1 Proc
        push EAX
        push EBX
        push ECX
        push EDX
        push EDI
        push ESI
        outstr 'Non-recursive answer: '
        xor EDX, EDX
        movzx EBX, BL
        xor ECX, ECX;       depth counter
        cmp EAX, EBX
        jb @less

@cyc:   cmp EAX, 0
        je @outp
        div EBX
        push EDX
        xor EDX, EDX
        inc ECX
        jmp @cyc

@outp:  cmp ECX, 0
        je @rt
        pop EAX
        outword EAX
        dec ECX
        jmp @outp

@less:  outword EAX

@rt:    newline
        pop ESI
        pop EDI
        pop EDX
        pop ECX
        pop EBX
        pop EAX
    ret
    Outd1 endp

    Outd2 Proc
        push EAX
        push EBX
        push ECX
        push EDX
        push EDI
        push ESI
        xor EDX, EDX
        movzx EBX, BL
        xor ECX, ECX;       depth counter
        cmp EAX, EBX
        jb @less

        div EBX
        call Outd2
        outword EDX
        jmp @rt
@less:  outword EAX

@rt:    pop ESI
        pop EDI
        pop EDX
        pop ECX
        pop EBX
        pop EAX
    ret
    Outd2 endp


    Start:
        ConsoleTitle 'Zvonov Andrey, 110 group, task 3'
        inint EAX, 'Enter the number: '
        inint BL, 'Enter the notation (2 to 10): '
        call Outd1
        outstr 'Recursive answer: '
        call Outd2
        newline
        pause 'Press any key to terminate'

        exit
    end Start
