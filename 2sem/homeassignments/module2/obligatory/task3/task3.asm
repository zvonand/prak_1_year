include console.inc
.data
        text db 10 dup (?), 0
.code
    Start:
        ConsoleTitle 'Zvonov Andrey, 110 group, obligatory task 3'
        inint EAX, 'Enter the number: '
        mov EBX, 10
        mov ECX, 9;     let it be the modificator
        cmp EAX, 0
        jg cycle
        jl minus
        outint EAX
        jmp cycle
minus:  outchar '-'
        neg EAX

cycle:  cmp EAX, 0
        je fin
        ;dec ECX
        sub EDX, EDX
        div EBX
        add EDX, '0'
        mov text[ECX], DL
        dec ECX
        jmp cycle

fin:    lea ESI, text
        inc ECX
        add ESI, ECX
        outstrln ESI

        pause 'Press any key to terminate'


    exit
    end Start
