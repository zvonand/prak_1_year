include console.inc
.code
    Start:
        ConsoleTitle 'Zvonov Andrey, 110 group, task 2'
        inchar BL, 'Enter the sequence: '

cycle:  cmp BL, '.'
        je fin
        cmp BL, '('
        je ignore
        cmp BL, ','
        je ignore
        cmp BL, ')'
        jne noncl

        pop EAX
        pop EDX
        pop ECX

        cmp CL, 'M'
        je max
        cmp EAX, EDX
        ja @F
        push EAX
        jmp ignore
@@:     push EDX
        jmp ignore

max:    cmp EAX, EDX
        jb @F
        push EAX
        jmp ignore
@@:     push EDX
        jmp ignore

noncl:  cmp BL, '0'
        jb jpush
        cmp BL, '9'
        ja jpush
        sub BL, '0'
jpush:  movzx EBX, BL
        push EBX

ignore: inchar BL
        jmp cycle

fin:    pop EDI
        outintln EDI

        pause 'Press any key to terminate'

    exit
    end Start
