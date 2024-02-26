include console.inc
.code
    Start:
        ConsoleTitle 'Zvonov Andrey, 110 group, task 1'
        inchar BL, 'Enter the sum: '

cycle:  cmp BL, '.'
        je fin
        cmp BL, '('
        je ignore
        cmp BL, ')'
        jne noncl
        pop EAX
        pop ECX
        pop EDX
        cmp CL, '+'
        jne minus
        add EAX, EDX
        push EAX
        jmp done
minus:  sub EDX, EAX
        push EDX
done:   jmp ignore


noncl:  cmp BL, '0'
        jb sign
        cmp BL, '9'
        ja sign
        sub BL, '0'
sign:   movzx EBX, BL
        push EBX

ignore: inchar BL
        jmp cycle

fin:    pop EDI
        outintln EDI

        pause 'Press any key to terminate'

    exit
    end Start
