include console.inc
.data
        z2 db 'Bad', 0
        z3 db 'Satisf', 0
        z4 db 'Good', 0
        z5 db 'Excell', 0

        adr dd z2, z3, z4, z5

.code
    Start:
        ConsoleTitle 'Zvonov Andrey, 110 group, obligatory task 2'
        inint EAX, 'Enter the grade: '
        sub EAX, 2
        mov EBX, adr[4 * EAX]


fin:    outstrln EBX
        pause 'Press any key to terminate'


    exit
    end Start
