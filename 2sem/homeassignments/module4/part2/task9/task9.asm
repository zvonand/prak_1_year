include console.inc
.data
        Eql db 'Equal', 0
        Neq db 'Not equal', 0
.code
    Form Proc
        push EBP
        mov EBP, ESP
        push EBX
        push ECX
        push EDX
        push EDI
        push ESI

        inchar CL
        cmp CL, '0'
        jb @notnm
        cmp CL, '9'
        ja @notnm
        movzx EAX, CL
        sub EAX, '0';       returned a number, no formula
        jmp @done

@notnm: call Form
        mov EBX, EAX
        inchar CL
        call Form
        xchg EAX, EBX;      first number in EAX, second - EBX, sign in CL

        cmp CL, '+'
        je @plus
        cmp CL, '-'
        je @minus
        cmp CL, '*'
        je @mult

@plus:  add EAX, EBX
        jmp @fin

@minus: sub EAX, EBX
        jmp @fin

@mult:  mul EBX
        jmp @fin
        
@fin:   inchar CL

@done:  pop ESI
        pop EDI
        pop EDX
        pop ECX
        pop EBX
        pop EBP
    ret
    Form endp


    Start:
        ConsoleTitle 'Zvonov Andrey, 110 group, task 9'
        outstr 'Enter the formulae: '
        call Form
        mov EBX, EAX
        inchar CL
        call Form
        mov EDX, offset Eql
        cmp EAX, EBX
        je outp
        mov EDX, offset Neq
outp:   outstrln EDX

        pause 'Press any key to terminate'

        exit
    end Start
