include console.inc

.code
    Start:
        ConsoleTitle 'Zvonov Andrey, 110 group, task6'
        sub ECX, ECX;       Result will be stored in ECX
        mov EDI, 5

        inchar AL, 'Enter your sequence: '

cycle:  sub AL, '0'
        movzx EBX, AL;      Expanding entered number to 32bit and move it to EBX
        mov EAX, ECX
        mul EDI;            Multiply previous result by 5
        mov ECX, EAX
        add ECX, EBX;       Add new number
        inchar AL
        cmp AL, '.';        If '.', then break cycle, else repeat again
        je fin
        jmp cycle

fin:    outwordln ECX

term:   pause 'Press any key to terminate'

        exit
    end Start
