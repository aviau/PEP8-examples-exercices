                 LDA         0,i
                 LDX         0,i

loopfil:         DECI        tableau,x
                 ADDX        2,i
                 CPX         ltableau,i
                 BRLT        loopfil

                 STRO        strprint,d

                 LDX         0,i
loopp:           LDA         tableau,x
                 STA         nb,d
                 DECO        nb,d
                 CHARO       '\n',i
                 ADDX        2,i
                 CPX         ltableau,i
                 BRLT        loopp
fin:             STOP


nb:              .WORD       0

strprint:        .ASCII      "\nImpression du tableau...\n\n\x00"

ltableau:        .EQUATE     20   ; Longueur en octets
tableau:         .WORD       0
                 .WORD       0
                 .WORD       0
                 .WORD       0
                 .WORD       0
                 .WORD       0
                 .WORD       0
                 .WORD       0
                 .WORD       0
                 .WORD       0
                 .END