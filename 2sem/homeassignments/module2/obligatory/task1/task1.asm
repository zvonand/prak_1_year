include console.inc
.data
        lat db 26 dup(0)
.code
    Start:
        ConsoleTitle 'Zvonov Andrey, 110 group, obligatory task 1'
        inchar BL, 'Enter the sequence: '

cycle:  cmp BL, '.'
        je fin
        mov AL, BL;         temporarily store input here
        sub BL, 'A'
        movzx EBX, BL
        cmp lat[EBX], 0
        jne inp
        add lat[EBX], 1
        outchar AL
inp:    inchar BL
        jmp cycle


fin:    outstrln ' '
        pause 'Press any key to terminate'


    exit
    end Start
