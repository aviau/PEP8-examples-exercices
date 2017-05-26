         DECI    x,d
         LDA     x,d
         CPA     10,i
         BRGT    bigger
         STRO    strsmal,d
         BR      fin
bigger:  STRO    strbig,d 
         BR      fin
fin:     STOP
strbig:  .ASCII  "> 10\x00" 
strsmal: .ASCII  "<= 10\x00"   
x:       .WORD   0
         .END