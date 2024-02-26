include console.inc

.code
    Start:
        ConsoleTitle 'Zvonov Andrey, 110 group, task8'

        inchar BL, 'Enter the sum: '
        sub EDI, EDI;       The sum will be accumulated in EDI
        mov CL, '+';        The sign will be stored in CL

cycle:  sub BL, '0'
        movzx EBX, BL;      Convert 8bit to 32bit

        cmp CL, '+';        Decide: addition or subtraction
        je plus
        jne minus

plus:   add EDI, EBX
        jmp cont

minus:  sub EDI, EBX

cont:   inchar CL;          Read new values
        cmp CL, '.';        Check if '.'
        je term
        inchar BL

        jmp cycle

term:   outintln EDI
        pause 'Press any key to terminate'

        exit
    end Start
