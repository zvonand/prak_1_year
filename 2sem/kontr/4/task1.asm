include console.inc
.data
        N equ 6
        Date_pack record D:5, M:4, Y:7
        D1 Date_pack <>
        D2 Date_pack <>
        Arr_of_Rec Date_pack N dup(<>)
        truestr db 'D1 < D2 == true', 0
        falsstr db 'D1 < D2 == false', 0
        Date_unpack struc
            D db ?
            M db ?
            Y db ?
        Date_unpack ends
        Arr_of_Struc Date_unpack N dup(<>)
.code

    InRec Proc
        push EBP
        mov EBP, ESP
        push EAX
        push EBX
        push ECX
        push EDX
        push EDI
        push ESI

        mov EBX, dword ptr [EBP + 8];       parameter offset
        inint DX
        mov CL, D
        sub CL, M
        shl DX, CL
        inint DI
        add DX, DI
        mov CL, M
        shl DX, CL
        inint DI
        add DX, DI
        mov word ptr [EBX], DX

        pop ESI
        pop EDI
        pop EDX
        pop ECX
        pop EBX
        pop EAX
        mov ESP, EBP
        pop EBP
    ret 4*1
    InRec endp

    Less Proc
        push EBP
        mov EBP, ESP
        push EBX
        push ECX
        push EDX
        push EDI
        push ESI

        xor AL, AL
        mov DX, word ptr [EBP + 12];      1st var
        mov BX, word ptr [EBP + 8];       2nd var

        mov DI, mask Y
        and DI, DX
        mov SI, mask Y
        and SI, BX
        cmp DI, SI
        jb @good
        ja @bad

        mov DI, mask M
        and DI, DX
        mov SI, mask M
        and SI, BX
        cmp DI, SI
        jb @good
        ja @bad

        mov DI, mask D
        and DI, DX
        mov SI, mask D
        and SI, BX
        cmp DI, SI
        jnb @bad

@good:  inc AL
@bad:   pop ESI
        pop EDI
        pop EDX
        pop ECX
        pop EBX
        mov ESP, EBP
        pop EBP
    ret 4*2
    Less endp

    Out_Rec Proc
        push EBP
        mov EBP, ESP
        push EAX
        push EBX
        push ECX
        push EDX
        push EDI
        push ESI

        mov EBX, dword ptr [EBP + 8]
        mov AX, BX

        mov DX, mask D
        mov CL, D
        and DX, AX
        shr DX, CL
        outword DX
        outchar '.'

        mov DX, mask M
        mov CL, M
        and DX, AX
        shr DX, CL
        outword DX
        outchar '.'

        mov DX, mask Y
        and DX, AX
        outword DX

        pop ESI
        pop EDI
        pop EDX
        pop ECX
        pop EBX
        pop EAX
        mov ESP, EBP
        pop EBP
    ret 4*1
    Out_Rec endp

    Min_Date Proc
        push EBP
        mov EBP, ESP
        push EBX
        push ECX
        push EDX
        push EDI
        push ESI

        mov ECX, dword ptr [EBP + 12];      Array Length
        mov EBX, dword ptr [EBP + 8];       Array Offset

        mov DX, word ptr [EBX];            Assume 1st elem is the smallest
        sub ECX, 1

@cyc:   cmp ECX, 0
        je @cycfin

        movzx EDI, DX
        movzx ESI, word ptr [EBX][2*ECX]
        push EDI
        push ESI
        call Less
        cmp AL, 1
        je @nextst
        mov DX, word ptr [EBX][2*ECX]

@nextst:dec ECX
        jmp @cyc

@cycfin:mov AX, DX
        pop ESI
        pop EDI
        pop EDX
        pop ECX
        pop EBX
        mov ESP, EBP
        pop EBP
    ret 4*2
    Min_Date endp

    Rec_To_Struc Proc
        push EBP
        mov EBP, ESP
        push EAX
        push EBX
        push ECX
        push EDX
        push EDI
        push ESI

        mov DI, Date_pack ptr [EBP + 12];      packed value, extended to 32-bit
        mov ESI, dword ptr [EBP + 8];       unpacked offset

        mov AX, mask D
        and AX, DI
        shr AX, D
        ;AL(AX) now contains Day values
        mov BX, mask M
        and BX, DI
        shr BX, M
        ;BL(BX) now contains Month values
        mov CX, mask Y
        and CX, DI
        ;CL(CX) now contains Year values

        mov (Date_unpack ptr [ESI]).D, AL
        mov (Date_unpack ptr [ESI]).M, BL
        mov (Date_unpack ptr [ESI]).Y, CL

        pop ESI
        pop EDI
        pop EDX
        pop ECX
        pop EBX
        pop EAX
        mov ESP, EBP
        pop EBP
    ret 4*2
    Rec_To_Struc endp

    Out_Struc Proc
        push EBP
        mov EBP, ESP
        push EAX
        push EBX
        push ECX
        push EDX
        push EDI
        push ESI

        mov ESI, dword ptr [EBP + 8];       data offset

        outword (Date_unpack ptr [ESI]).D
        outchar '.'
        outword (Date_unpack ptr [ESI]).M
        outchar '.'
        outwordln (Date_unpack ptr [ESI]).Y

        pop ESI
        pop EDI
        pop EDX
        pop ECX
        pop EBX
        pop EAX
        mov ESP, EBP
        pop EBP
    ret 4*1
    Out_Struc endp

    Ptr_to_Min_Date Proc
        push EBP
        mov EBP, ESP
        push EBX
        push ECX
        push EDX
        push EDI
        push ESI

        mov ECX, dword ptr [EBP + 12];      Array Length
        mov EBX, dword ptr [EBP + 8];       Array Offset

        dec ECX
        movzx EDX, word ptr [EBX];            Assume first elem is the smallest
        lea EDI, [EBX]

@cyc:   cmp ECX, 0
        je @cycfin

        movzx ESI, word ptr [EBX][2*ECX]
        push EDX
        push ESI
        call Less
        cmp AL, 1
        je @nextst
        movzx EDX, word ptr [EBX][2*ECX]
        lea EDI, [EBX][2*ECX]

@nextst:dec ECX
        jmp @cyc

@cycfin:mov EAX, EDI
        pop ESI
        pop EDI
        pop EDX
        pop ECX
        pop EBX
        mov ESP, EBP
        pop EBP
    ret 4*2
    Ptr_to_Min_Date endp

    Sort Proc
        push EBP
        mov EBP, ESP
        push EAX
        push EBX
        push ECX
        push EDX
        push EDI
        push ESI

        mov ECX, dword ptr [EBP + 12];      Array Length
        mov EBX, dword ptr [EBP + 8];       Array Offset

        xor EDI, EDI;                       Cycle Counter

@cyc:   cmp EDI, ECX
        je @fin
        lea ESI, [EBX][2*EDI]
        mov EDX, ECX
        sub EDX, EDI
        push EDX
        push ESI
        call Ptr_to_Min_Date
        mov DX, word ptr [EBX][2*EDI]
        mov SI, word ptr [EAX]
        mov word ptr [EAX], DX
        mov word ptr [EBX][2*EDI], SI
        inc EDI
        jmp @cyc


@fin:   pop ESI
        pop EDI
        pop EDX
        pop ECX
        pop EBX
        pop EAX
        mov ESP, EBP
        pop EBP
    ret 4*2
    Sort endp


    Start:
        ConsoleTitle 'Zvonov Andrey, 110 group, task1'
        outstrln 'All stages completed'
        outstrln 'Enter 1st date: '
        push offset D1
        call InRec
        outstrln 'Enter 2nd date: '
        push offset D2
        call InRec
        newline
        movzx EBX, D1
        movzx EDX, D2
        push EBX
        push EDX
        call Less
        mov EDI, offset truestr
        cmp AL, 0
        jne chkd
        mov EDI, offset falsstr
chkd:   outstrln EDI
        newline
        push EBX
        call Out_Rec
        push EDX
        newline
        call Out_Rec
        newline

        outstrln 'Enter 6 dates: '
        xor ECX, ECX
incyc:  cmp ECX, N
        je infin
        lea EDI, word ptr Arr_of_Rec[2*ECX]
        push EDI
        call InRec
        inc ECX
        jmp incyc

infin:  newline
        xor ECX, ECX
        outstrln 'Printing the Records'
outcyc: cmp ECX, N
        je outfin
        lea EDI, word ptr Arr_of_Rec[2*ECX]
        mov DI, word ptr [EDI]
        movzx EDI, DI
        push EDI
        call Out_Rec
        newline
        inc ECX
        jmp outcyc

outfin: newline

        xor AL, AL
        mov ECX, 1
cmpcyc: cmp ECX, N
        je cmpfin
        lea EDI, word ptr Arr_of_Rec[2*ECX - type Date_pack]
        mov DI, word ptr [EDI]
        movzx EDI, DI
        push EDI
        lea ESI, word ptr Arr_of_Rec[2*ECX]
        mov SI, word ptr [ESI]
        movzx ESI, SI
        push ESI
        call Less
        cmp AL, 0
        je ns
        inc ECX
        jmp cmpcyc

cmpfin: outstrln 'Sorted, converting to structure'
        jmp step4
ns:     outstrln 'Unsorted, finding minimum'
        newline
        push N
        push offset Arr_of_Rec
        call Min_Date
        movzx EAX, AX
        outstr 'Minimum found: '
        push EAX
        call Out_Rec
        newline
        jmp stg5;           terminate


step4:  xor ECX, ECX
cyc4:   cmp ECX, N
        je cyc4fin
        movzx EAX, Arr_of_Rec[2*ECX]
        push EAX
        lea EAX, Arr_of_Struc[ECX][2*ECX]
        push EAX
        call Rec_To_Struc
        inc ECX
        jmp cyc4

cyc4fin:xor ECX, ECX
        outstrln 'Printing the structure: '
strou:  cmp ECX, N
        je stg5
        lea EAX, Arr_of_Struc[ECX][2*ECX]
        push EAX
        call Out_Struc
        inc ECX
        jmp strou

stg5:   push N
        push offset Arr_of_Rec
        ;call Ptr_to_Min_Date
        ;movzx EAX, word ptr [EAX]
        ;push EAX
        ;call Out_Rec
        call Sort
        newline

        xor ECX, ECX
        outstrln 'Printing the sorted array: '
oucyc: cmp ECX, N
        je oufin
        lea EDI, word ptr Arr_of_Rec[2*ECX]
        mov DI, word ptr [EDI]
        movzx EDI, DI
        push EDI
        call Out_Rec
        newline
        inc ECX
        jmp oucyc

oufin: newline

term:   newline
        pause 'Press any key to terminate'


    exit
    end Start
