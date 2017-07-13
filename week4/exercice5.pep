         LDA     tab,iz
         LDX     10,i
         CALL    readstr
         STRO    tab,d
         STOP

; readstr
; PARAMS:
;    A: tableau
;    X: Nombres de caractères maximum
readstr: NOP0
         ; Initialisation des variables
         SUBSP   4,i
maxchar: .EQUATE 0
addrtab: .EQUATE 2
         STA     addrtab,s
         STX     maxchar,s

         LDX     0,i

read:    NOP0
         CHARI   addrtab,sxf

         ; Newline?
         LDA     0,i
         LDBYTEA addrtab,sxf
         CPA     '\n',i
         BREQ    endread

         ; Max chars?
         ADDX    1,i
         CPX     maxchar,s
         BREQ    endread

         BR      read

endread: NOP0
         LDA     '\x00',i
         STA     addrtab,sxf

         ADDSP   4,i
         RET0



; Variables
tab:     .BLOCK  6

.END