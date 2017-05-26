                 DECI        loops,d
                 LDA         0,i
loop:            CPA         loops,d
                 BRGE        fin
                 STA         i,d
                 STRO        strit,d 
                 DECO        i,d
                 CHARO       '\n',i
                 ADDA        1,i
                 BR          loop
fin:             STOP
loops:           .WORD       0
i:               .WORD       0
strit:           .ASCII      "Iteration \x00"
                 .END