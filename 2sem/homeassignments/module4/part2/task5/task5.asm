include console.inc
.code
    Input Proc
        push ECX


        inint ECX
        cmp ECX, 0
        je @done
        jg @grtr
        jl @smlr

@grtr:  call Input
        outint ECX
        outchar ' '
        jmp @done

@smlr:  outint ECX
        outchar ' '
        call Input
        jmp @done

@done:  pop ECX
    ret
    Input endp


    Start:
        ConsoleTitle 'Zvonov Andrey, 110 group, task 5'
        outstr 'Enter the sequence: '
        call Input
        newline
        pause 'Press any key to terminate'

        exit
    end Start
