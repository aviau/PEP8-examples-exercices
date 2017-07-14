         LDA     13,i

         CALL    fib

         SUBSP   2,i
         STA     0,s
         DECO    0,s
         ADDSP   2,i

         STOP

;    PARAMS
;        A = num
fib:     NOP0
         CPA     2,i
         BRLT    fibret

         ; STORE num and retvat
num:     .EQUATE 0
retval:  .EQUATE 2
         SUBSP   4,i
         STA     num,s ; store num

         ; Set revtal to fib(num-1)
         SUBA    1,i         ; num-1
         call    fib         ; fib(num-1)
         STA     retval,s    ; store in retval

         ; Calculate fib(num-2)
         LDA     num,s       ; load num
         SUBA    2,i         ; num-2
         call    fib         ; fib(num-2)

         ; A += retval
         ADDA    retval,s

         ; Free variables
         ADDSP   4,i


fibret:  NOP0
         RET0



; Variables
         .END
