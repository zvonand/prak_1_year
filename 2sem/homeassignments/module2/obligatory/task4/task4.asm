include console.inc
.data
        text db 10 dup (?), 0
        nums db '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'
.code
    Start:
        ConsoleTitle 'Zvonov Andrey, 110 group, obligatory task 4'
        inint EAX, 'Enter the number: '
        mov EBX, 16
        mov ECX, 9;     let it be the modificator
        cmp EAX, 0
        jne cycle
        outint EAX

cycle:  cmp EAX, 0
        je fin
        sub EDX, EDX
        div EBX
        mov DL, nums[EDX]
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
