include console.inc
.code
    MaxMin Proc
        push EBP
        mov EBP, ESP
        push EBX
        push ECX
        push EDX
        push EDI
        push ESI

        inchar CL

        cmp CL, 'm'
        je @fmin
        cmp CL, 'M'
        je @fmax

        sub CL, '0'
        mov AL, CL
        jmp @fin

@fmin:  inchar CL
        call MaxMin
        mov BL, AL
        inchar CL
        call MaxMin
        cmp AL, BL
        jb @rd1
        xchg AL, BL
@rd1:   jmp @done

@fmax:  inchar CL
        call MaxMin
        mov BL, AL
        inchar CL
        call MaxMin
        cmp AL, BL
        ja @rd2
        xchg AL, BL
@rd2:   jmp @done


@done:  inchar CL
@fin:   pop ESI
        pop EDI
        pop EDX
        pop ECX
        pop EBX
        pop EBP
    ret
    MaxMin endp


    Start:
        ConsoleTitle 'Zvonov Andrey, 110 group, task 8'
        outstr 'Enter the formula: '
        call MaxMin
        outwordln AL
        pause 'Press any key to terminate'

        exit
    end Start
