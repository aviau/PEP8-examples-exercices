; Exercice 2
         DECI    nombre,d
         DECI    nombre2,d
         LDA     nombre,d
         ADDA    nombre2,d
         STA     nombre2,d
         DECO    nombre2,d
         STOP
nombre:  .WORD   0
nombre2: .WORD   0
         .END
