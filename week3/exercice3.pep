                 LDA         0,i
                 LDX         0,i


whileswp:        LDA         swapped,d
                 CPA         1,i          ; Check if we swapped
                 BRNE        imprim       ; didn't swap. We can now print the array

                 LDA         0,i          ; swapped = False
                 STA         swapped,d    ; swapped = False

                                          ; for(i = 1; i < xlen; i++)

                 LDA         2,i          ; i=1
                 STA         i,d          ; i=1

loopsort:        LDA         i,d          ; i < xlen ?
                 CPA         ltableau,i   ; i < xlen ?

                 BRGT        whileswp     ; if i < xlen THEN back to main loop

                 LDX         i,d          ; SET X to i
                 LDA         tableau,x    ; LOAD array[x]
                 SUBX        2,i          ; SET x to i-1
                 CPA         tableau,x    ;if(array[i] < array[i - 1])
                 BRGE        incremi
                                          ; We should swap!!!
                 STA         nb,d         ; tmp = array[i]
                 LDA         tableau,x    ; LOAD array[i - 1]
                 LDX         i,d          ; SET X to i
                 STA         tableau,x    ; x[i] = x[i - 1];
                 SUBX        2,i          ; SET x to i-1
                 LDA         nb,d
                 STA         tableau,x
                 LDA         1,i          ; swapped = True
                 STA         swapped,d    ; swapped = True


incremi:         LDA         i,d          ; i++
                 ADDA        2,i          ; i++
                 STA         i,d          ; i++

                 BR          loopsort

                 BR          whileswp


; Impression du tableau
imprim:          STRO        strprint,d
                 LDX         0,i
loopimp:         LDA         tableau,x
                 STA         nb,d
                 DECO        nb,d
                 CHARO       '\n',i
                 ADDX        2,i
                 CPX         ltableau,i
                 BRLT        loopimp
fin:             STOP

nb:              .WORD       0
i:               .WORD       0
swapped:         .WORD       1
strprint:        .ASCII      "\nImpression du tableau...\n\n\x00"
ltableau:        .EQUATE     20   ; Longueur en octets

tableau:         .WORD       9
                 .WORD       8
                 .WORD       7
                 .WORD       6
                 .WORD       5
                 .WORD       4
                 .WORD       3
                 .WORD       2
                 .WORD       1
                 .WORD       0
                 .END
