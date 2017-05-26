         DECI    x,d
         LDA     x,d
         CPA     10,i
         BRLT    smaller
         STRO    strbig,d
         BR      fin
smaller: STRO    strsmal,d 
         BR      fin
fin:     STOP
strsmal: .ASCII  "< 10\x00" 
strbig:  .ASCII  ">= 10\x00"   
x:       .WORD   0
         .END