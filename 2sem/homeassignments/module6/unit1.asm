include console.inc
public In4, Out4
.code
    In4 Proc;           number offset as a parameter
        push EBP
        mov EBP, ESP
        push EAX
        push EBX
        push ECX
        push EDX
        push ESI
        push EDI;       registers recovery

        mov EAX, dword ptr [EBP + 8]
        xor EBX, EBX
        inchar DL, 'Enter the number: '

@incyc: cmp DL, ' '
        je @infin
        shl EBX, 2
        sub DL, '0'
        movzx EDX, DL
        add EBX, EDX
        inchar DL
        jmp @incyc

@infin: mov dword ptr [EAX], EBX
        pop EDI
        pop ESI
        pop EDX
        pop ECX
        pop EBX
        pop EAX
        mov ESP, EBP
        pop EBP
    ret 4*1
    In4 endp


    Out4 Proc;           number offset as a parameter
        push EBP
        mov EBP, ESP
        push EAX
        push EBX
        push ECX
        push EDX
        push ESI
        push EDI;       registers recovery

        mov EAX, dword ptr [EBP + 8]
        xor ECX, ECX

@outcyc:cmp ECX, 16
        je @outfin
        mov EBX, EAX
        rol EBX, 2
        and EBX, 3
        outword EBX
        rol EAX, 2
        inc ECX
        jmp @outcyc


@outfin:
        pop EDI
        pop ESI
        pop EDX
        pop ECX
        pop EBX
        pop EAX
        mov ESP, EBP
        pop EBP
    ret 4*1
    Out4 endp

end
