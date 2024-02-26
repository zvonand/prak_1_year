include console.inc

.data
        N dd ?
.code
    Start:

        ConsoleTitle 'Zvonov Andrey, 110 group, task5'

        inintln N, 'Enter your number: '
        mov EAX, N

        mov EDI, 10;    we will apply 32-bit division by 10

        cmp EAX, EDI
        jb only1;       make the first comparison

        sub EDX, EDX
        div EDI
        mov CL, DL

cycle:  cmp EAX, EDI;   compare the integer part to 10
        jb first;       if less, goto FIRST (first digit found)
        sub EDX, EDX
        div EDI
        jmp cycle

only1:  mul AL
        jmp fin

first:  mul CL

fin:    outintln AX

term:   pause 'Press any key to terminate'

        exit
    end Start
