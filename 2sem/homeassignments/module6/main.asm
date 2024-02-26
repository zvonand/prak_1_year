include console.inc
public X
extern In4@0: proc, Out4@0: proc, Print: near
.data
        X dd ?
.code
    Start:
        ConsoleTitle 'Zvonov Andrey, 110 group, module 6'

        push offset X
        call In4@0
        newline

        push X
        call Out4@0
        newline

        jmp Print
    end Start
