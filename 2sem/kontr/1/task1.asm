include console.inc

.code
    Start:
        ConsoleTitle 'Zvonov Andrey, 110 group, task1'
        inintln EBX, 'Enter the number: '

        mov EAX, EBX
        sub EDX, EDX
        mov ECX, 10000000
        div ECX

        cmp EAX, 10
        jae no
        cmp EAX, 0
        je no
        
        mov EAX, EBX
        mov ECX, 1000
        sub EDX, EDX
        div ECX
        mul ECX
        add EAX, 123
        mov EBX, EAX

no:     outwordln EBX

        pause 'Press any key to terminate'

        exit
    end Start
