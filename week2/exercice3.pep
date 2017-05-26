         DECI    min,d
         DECI    max,d
         DECI    nb,d
         LDA     nb,d

         ; if nb >= min and nb <= max then
         CPA     min,d
         BRLT    chklow
         CPA     max,d
         BRGT    chklow
         STRO    strinb,d
         BR      fin

         ;else if nb < min then
chklow:  CPA     min,d
         BRLT    toolow
         BR      toohigh
toolow:  STRO    strlow,d 
         BR      fin
toohigh: STRO    strhigh,d 
         BR      fin
fin:     STOP


min:     .WORD   0
max:     .WORD   0
nb:      .WORD   0
strlow:  .ASCII  "Too low \x00"
strinb:  .ASCII  "In bounds\x00"
strhigh: .ASCII  "Too high\x00"
         .END