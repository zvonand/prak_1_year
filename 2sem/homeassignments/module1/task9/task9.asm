include console.inc

.code
    Start:

        inchar BL, 'Enter the words: '
        sub EDI, EDI;       Counter

outer:
        mov AL, BL;         First symbol of a word stored in AL
        mov CL, BL
        inchar BL

inner:  cmp BL, ','
        je ou
        cmp BL, '.'
        je ou

        mov CL, BL;         Previous char is stored in CL
        inchar BL
        jmp inner

ou:     cmp AL, CL;         Check if need to increment the counter
        jne pass
        inc EDI

pass:   cmp BL, '.'
        je fin

        inchar BL
        jmp outer

fin:    outintln EDI

        pause 'Press any key to terminate'

        exit
    end Start
