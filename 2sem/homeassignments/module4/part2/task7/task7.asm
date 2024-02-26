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

        mov EAX, dword ptr [EBP + 8]
        mov EBX, dword ptr [EBP + 12]

        cmp EBX, 0
        je @done
        cmp EAX, 0
        xchg EAX, EBX
        je @done

        cmp EAX, EBX
        jae @sbtr
        xchg EAX, EBX
@sbtr:  sub EAX, EBX
        push EBX
        push EAX
        call Gcd

@done:
        pop ESI
        pop EDI
        pop EDX
        pop ECX
        pop EBX
        pop EBP
    ret 4*2
    Gcd endp


    Start:
        ConsoleTitle 'Zvonov Andrey, 110 group, task 7'
        inint EAX, 'Enter the numbers: '
        inint EBX
        push EBX
        push EAX
        call Gcd
        outstr 'GCD is '
        outwordln EAX
        pause 'Press any key to terminate'

        exit
    end Start
