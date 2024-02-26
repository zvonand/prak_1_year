include console.inc
.code
    Reverse Proc
        push EAX
        push EBX
        push ECX
        push EDX
        push EDI
        push ESI

        inchar CL
        cmp CL, '.'
        je @done

        call Reverse
        outchar CL

@done:  pop ESI
        pop EDI
        pop EDX
        pop ECX
        pop EBX
        pop EAX
    ret
    Reverse endp

    Start:
        ConsoleTitle 'Zvonov Andrey, 110 group, task 4'
        outstr 'Enter the text: '
        call Reverse
        newline
        pause 'Press any key to terminate'

        exit
    end Start
