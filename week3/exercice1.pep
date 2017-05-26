                 LDA         0,i
                 LDX         0,i

loop:            LDA         tableau,x
                 STA         nb,d
                 DECO        nb,d
                 CHARO       '\n',i
                 ADDX        2,i
                 CPX         ltableau,i
                 BRLT        loop
fin:             STOP


nb:              .WORD       0

ltableau:        .EQUATE     20   ; Longueur en octets
tableau:         .WORD       1
                 .WORD       2
                 .WORD       3
                 .WORD       4
                 .WORD       5
                 .WORD       6
                 .WORD       7
                 .WORD       8
                 .WORD       9
                 .WORD       10
                 .END