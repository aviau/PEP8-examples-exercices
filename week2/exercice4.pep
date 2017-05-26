                 CHARI       chr,d
                 LDA         0,i
                 LDBYTEA     chr,d
                 ;if (chr >= 'a' and chr <= 'z')
                 CPA         'a',i
                 BRLT        chkcaps
                 CPA         'z',i
                 BRGT        chkcaps
                 BR          islett
                 ;or (chr >= 'A' and chr <= 'Z')
chkcaps:         CPA         'A',i
                 BRLT        notlet
                 CPA         'Z',i
                 BRGT        notlet
                 BR          islett 
notlet:          STRO        notltr,d
                 BR          fin
islett:          STRO        isltr,d
                 BR          fin

fin:             STOP
chr:             .BYTE       0
isltr:           .ASCII      "It is a letter\x00"
notltr:          .ASCII      "Not a letter\x00"
                 .END