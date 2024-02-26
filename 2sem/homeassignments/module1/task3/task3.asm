include console.inc

.data
    S db 'Balanced', 0
    Q db 'Not balanced', 0

.code
    Start:
        ConsoleTitle 'Zvonov Andrey, 110 group, task3'
        inchar BL , 'Enter the sequence: '
        sub ESI, ESI;     ESI will be the counter
        mov EDI, offset S


cycle:  cmp BL, '.'
        je fin;         end of text

        cmp BL, ')';    if inp = ')' then goto clo
        je clo

        cmp BL, '(';    if inp = '(' then goto ope
        je ope

chk:    cmp ESI, 0
        jl nblncd

        inchar BL
        jmp cycle

clo:    dec ESI
        jmp chk

ope:    inc ESI
        jmp chk

fin:    cmp ESI, 0
        jne nblncd
        jmp outp
nblncd: mov EDI, offset Q
        jmp outp

outp:   outstrln EDI

term:   pause 'Press any key to terminate'
        exit
        end Start
