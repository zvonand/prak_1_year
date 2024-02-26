include console.inc

.data
    N dd ?
    M dd ?
    S db 'Not prime', 0
    Q db 'Prime', 0

.code
    Start:
        ConsoleTitle 'Zvonov Andrey, 110 group, task2'
        inint N, 'Enter the number: '
        mov EBX, 2;         Here comes the counter
        mov ECX, N
        mov ESI, ECX;       N will be stored in ESI throughout the execution
        mov EAX, ECX
        sub EDX, EDX;       Assign EDX := 0
        div EBX
        xchg ECX, EAX;      Put upper bound in ECX, return N to EAX
        mov EDI, offset Q;         Here we store the output string


cycle:  cmp EBX, ECX
        ja fin
        sub EDX, EDX;       Assign EDX := 0
        mov EAX, ESI
        div EBX
        cmp EDX, 0
        je found;           Quit cycle if divisor found
        inc EBX
        jmp cycle

found:  mov EDI, offset S

fin:    outstrln EDI

        pause 'Press any key to terminate'
        exit
    end Start
