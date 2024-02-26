include console.inc
.const
  E = -1
.data
  N dd ?
.code
    Start:
        ConsoleTitle 'Zvonov Andrey, 110 group, task1'
        inint N, 'Enter the number: '
        mov EBX, 3
        mov DI, 0
        mov ECX, N ; Inputing N, putting it in ECX

eq1:    cmp ECX, 1
        je fin;          If N = 1 then jump to output
        mov EAX, ECX;    get ready for division
        sub EDX, EDX;    get ready for division(2)
        div EBX;         div on EAX, mod on EDX
        cmp EDX, 0;      check if mod <> 0 then assign K := -1 and output
        jne npw
        inc DI;           K := K + 1
        mov ECX, EAX;    place N div 3 back to ECX
        jmp eq1

npw:    mov DI, E;        K := 1

fin:    outintln DI,, 'The answer is '

        pause 'Press any key to terminate'
    exit
    end Start
