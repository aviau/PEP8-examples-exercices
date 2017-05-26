read:            CHARI       c,d
                 LDA         0,i
                 LDBYTEA     c,d
                 CPA         '\n',i
                 BREQ        ponlyltr
                 ;if (chr >= 'a' and chr <= 'z')
                 CPA         'a',i
                 BRLT        chkcaps  ; Maybe its in caps?
                 CPA         'z',i
                 BRGT        chkcaps  ; Maybe its in caps?
                 BR          read     ; It is a letter!
                 ;or (chr >= 'A' and chr <= 'Z')
chkcaps:         CPA         'A',i
                 BRLT        pnonltr  ; Not a letter.
                 CPA         'Z',i
                 BRGT        pnonltr  ; Not a letter.
                 BR          read     ; Read the next char

ponlyltr:        STRO        ltronly,d
                 STOP

pnonltr:         STRO        nonltr,d
                 STOP

c:               .BYTE       0
nonltr:          .ASCII      "There was a non-letter character in the string\x00"
ltronly:         .ASCII      "The string contained letters only\x00"
                 .END