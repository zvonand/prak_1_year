include console.inc
.data
        S1 db '  |  0  1  2  3  4  5  6  7  8  9 ', 0
        S2 db 33 dup('-'), 0

.code
    Start:
        ConsoleTitle 'Zvonov Andrey, 110 group, task10'
        outstrln offset S1
        outstrln offset S2

        sub BL, BL;         Inner cycle counter
        sub BH, BH;         Outer cycle counter

outer:  outint BH
        outstr ' |'
        sub BL, BL;         BL := 0

inner:  mov AL, BL
        mul BH
        outchar ' '
        cmp AX, 10;         Decide whether additional space is needed
        jae pass
        outchar ' '

pass:   outint AX

        inc BL
        cmp BL, 10
        jb inner

        outcharln ' '
        inc BH
        cmp BH, 10
        jb outer

        pause 'Press any key to terminate'
        exit
    end Start
