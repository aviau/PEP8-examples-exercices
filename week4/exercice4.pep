                 LDA         0,i
                 LDX         1,i
                 call        pval
                 STOP

; Imprime une valeur
; PARAMS:
;        A: x
;        X: y
pval:            NOP0
                 STA         xpos,d
                 STX         ypos,d

                 LDX         0,i

; Le registre X devrait être: Y * nbcols + X
; Commencons par Y * nbcols
loopy:           NOP0
                 LDA         ypos,d
                 CPA         0,i
                 BREQ        endloopy
                 LDA         ncols,i
loop1:           CPA         0,i
                 BRLE        endloop1
                 ADDX        2,i
                 SUBA        1,i

                 BR          loop1
endloop1:        NOP0
                 LDA         ypos,d
                 SUBA        1,i
endloopy:        NOP0

                 LDA         xpos,d
loopx:           CPA         0,i
                 BRLE        endloopx
                 ADDX        2,i
                 SUBA        1,i
                 BR          loopx
endloopx:        NOP0

                 DECO tab,x

                 RET0

; Variables
xpos:    .WORD   0
ypos:    .WORD   0

ncols:   .EQUATE 3

tab:     .WORD   1
         .WORD   2
         .WORD   3
         .WORD   4
         .WORD   5
         .WORD   6
         .WORD   7
         .WORD   8
         .WORD   9
         .WORD   10
         .WORD   11
         .WORD   12

.END
