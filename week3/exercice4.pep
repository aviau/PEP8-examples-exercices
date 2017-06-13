         LDX     0,i
         LDA     0,i


read:    CPX     10,i
         BRGT    print       ; Si on a dépassé 10, on a fini
         CHARI   str,x 
         LDBYTEA str,x
         CPA     '\n',i
         BREQ    print       ; Si on entre \n, c'est fini
         ADDX    1,i         ; incrémente X
         BR      read

print:   LDA     '\x00',i
         STA     str,x
         STRO    str,d
         STOP

pos:     .WORD   0
cur_c:   .BLOCK  1
str:     .BLOCK  11
bad:     .ASCII "DONTPRINTMEPLZZZ"
         .END