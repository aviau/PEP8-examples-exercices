
         ; Appel à la fonction div
         SUBSP   4,i

         ; Paramètre 1 dividende
         LDA     11,i
         STA     0,s

         ; Paramètre 2 diviseur
         LDA     2,i
         STA     2,s

         call div



         DECO    0,s
         CHARO   '\n',i
         DECO    2,s

         ADDSP   4,i

         STOP



div:     NOP0
         ; Initialisation des variables
         SUBSP   2,i
quot:    .EQUATE 0
dividend:.EQUATE 4
divdr:   .EQUATE 6
         LDA     0,i
         STA     quot,s

loop:    NOP0
         LDA     dividend,s
         CPA     divdr,s
         BRLT    endloop

         ; dividend -= divider
         SUBA    divdr,s
         STA     dividend,s

        ; quot += 1
         LDA     quot,s
         ADDA    1,i
         STA     quot,s

         BR      loop

endloop: NOP0

         ; divdr = quot
         LDA     quot,s
         STA     divdr,s

         ADDSP   2,i
         RET0




; Variables


         .END
