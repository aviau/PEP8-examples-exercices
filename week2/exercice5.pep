                 CHARI       chr1,d
                 CHARI       chr2,d
                 LDA         0,i
                 LDBYTEA     chr1,d   ;LDBYTE populates the END of the accumulator
                 ; if chr1 > chr2 then
                 CPA         g2,d
                 BRGT        printgt
                 ; else if chr1 < chr2 then
                 BRLT        printst
                 BR          printeq
printst:         sTRO        str1st2,d
                 BR          fin
printgt:         STRO        str1gt2,d 
                 BR          fin
printeq:         STRO        streq,d
                 BR          fin
fin:             STOP
str1gt2:         .ASCII      "chr1 > chr2\x00"
str1st2:         .ASCII      "chr1 < chr2\x00"
streq:           .ASCII      "chr1 == chr1\x00"
chr1:            .BYTE       0
g2:              .BYTE       0
chr2:            .BYTE       0
                 .BYTE       0
                 .END