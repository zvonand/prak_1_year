include console.inc

.code
    Start:
        ConsoleTitle 'Zvonov Andrey, 110 group, task2'

        inchar AL, 'Enter the text: '
        mov BL, 0
        mov DL, 0


cycle:  cmp AL, '.'
        je fin

        cmp DL, 1
        jne fal
        cmp AL, 'O'
        jne sta
        mov DL, 0
        jmp yes
sta:    outchar BL
        inchar AL
        jmp cycle

fal:    mov DL, 0
        cmp AL, 'G'
        jne notg
        mov BL, 'G'
        mov DL, 1
        jmp yes
notg:   cmp AL, 'T'
        jne nott
        mov BL, 'T'
        mov DL, 1
        jmp yes

nott:   outchar AL
yes:    inchar AL
        jmp cycle

fin:    cmp DL, 1
        jne term
        outchar BL
        outchar AL


term:   outcharln ' '
        pause 'Press any key to terminate'

        exit
    end Start
