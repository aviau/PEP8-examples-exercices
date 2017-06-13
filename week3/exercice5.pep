; Définissez une matice de 3 * 4 entiers de la première
; façon mentionnée plus haut. Puis, affichez le contenu
; de la matrice ligne par ligne.

LDA 0,i
LDX 0,i

; On set X au début de la ligne
; A représente le nomnre d'itérations
lnofset:         LDX         0,i
                 LDA         0,i

incx:            CPA         cur_lin,d
                 BREQ        pline        ; Quand l'accumulateur atteint le numéro de la ligne, on a fini d'incrémenter X
                 ADDX        col_cnt,i    ; Incrémenter X du nombre de colones qu'il y a dans une ligne
                 ADDX        col_cnt,i    ; 2 fois parce que 1 word = 2 bytes
                 ADDA        1,i
                 BR          incx

pline:           LDA         0,i
pcol:            DECO        tableau,x    ; Print la colonne
                 CHARO       ',',i
                 ADDA        1,i
                 ADDX        2,i
                 CPA         col_cnt,i
                 BREQ        nxtln 
                 BR          pcol

nxtln:           CHARO       '\n',i
                 LDA         cur_lin,d
                 ADDA        1,i
                 CPA         line_cnt,i
                 BREQ        fin
                 STA         cur_lin,d
                 BR          lnofset


fin:             STOP

cur_lin:         .WORD 0


line_cnt:        .EQUATE 4
col_cnt:         .EQUATE 3

tableau:         .WORD 1
                 .WORD 2
                 .WORD 3
                 .WORD 4
                 .WORD 5
                 .WORD 6
                 .WORD 7
                 .WORD 8
                 .WORD 9
                 .WORD 10
                 .WORD 11
                 .WORD 12
                 .END