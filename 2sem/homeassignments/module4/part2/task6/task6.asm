include console.inc
.code
    Gcd Proc
        push EBP
        mov EBP, ESP
        push EBX
        push ECX
        push EDX
        push EDI
        push ESI

        

@done:  pop ESI
        pop EDI
        pop EDX
        pop ECX
        pop EBX
        pop EBP
    ret 4*1
    Gcd endp


    Start:
        ConsoleTitle 'Zvonov Andrey, 110 group, task 6'
        inint EAX, 'Enter the number: '
        push EAX
        call MaxDig
        outword EAX
        newline
        pause 'Press any key to terminate'

        exit
    end Start
