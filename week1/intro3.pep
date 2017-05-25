; Byte vs WORD
         LDA     0,i
         LDBYTEA nombre,d
         LDA     nombre,d
         LDBYTEA nombre,d
         LDA     nombre,d
         STOP
nombre:  .BYTE   1
nombre2: .WORD   2
         .END
