include console.inc
public Print
extern X: dword

.code
    Print:
        outwordln X

        pause 'Press any key to terminate'

    exit
    end
