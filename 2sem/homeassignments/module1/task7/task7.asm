include console.inc

.data
        N dd ?

.code
    Start:
        ConsoleTitle 'Zvonov Andrey, 110 group, task7'

        inintln N, 'Enter the number: '

        mov EAX, N
        mov EDI, 7

        sub EDX, EDX
        div EDI;            EDX := (N mod 7)

        mov EAX, N;         Put N back to EAX, the result will be stored here

        cmp EDX, 4;         Check if (N mod 7) less or (greater or equal) then 4
        jae grtr
        jb smllr

grtr:   sub EDI, EDX
        add EAX, EDI
        jmp term

smllr:  sub EAX, EDX

term:   outwordln EAX

        pause 'Press any key to terminate'

        exit
    end Start
