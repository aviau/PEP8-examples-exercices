; Exercice 1
         DECI    nombre,d
         LDA     nombre,d
         ADDA    10,i
         STA     nombre,d
         DECO    nombre,d
         STOP
nombre:  .WORD   0
         .END
