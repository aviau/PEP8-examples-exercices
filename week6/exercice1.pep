         STRO    str1,d
         DECI    taille,d

         LDX     taille,d
         call    malloc
         STX     tableau,d

         SUBSP   2,i
         LDA     0,i
         STA     0,s

         LDX     0,i
loop:    NOP0

         LDA     0,s
         ADDA    1,i
         STA     0,s
         CPA     taille,d
         BRGT    endloop

         DECI    tableau,sxf

         ADDX    2,i

         BR      loop
endloop: ADDSP   2,i

STRO     str2,d

         SUBSP   2,i
         LDX     0,i
         LDA     0,i
         STA     0,s
print:   NOP0

         LDA     0,s
         ADDA    1,i
         STA     0,s
         CPA     taille,d
         BRGT    endprint

         DECO    tableau,sxf
         CHARO   '\n',i

         ADDX    2,i
         BR      print
endprint:ADDSP   2,i


         STOP



; Variables
taille:  .WORD   0
tableau: .WORD   0

str1:    .ASCII  "Entrez la taille du tableau:\n\x00"
str2:    .ASCII  "Voici le tableau:\n\x00"

; Allocates 'n' bytes in the Heap
;
; Params:
;     * Register A: 'n' bytes to allocate
; Returns:
;     * Register X: Address of the allocated block
malloc:  LDX	heap_ptr, d
         ADDA	heap_ptr, d
         STA	heap_ptr, d
         RET0
heap_ptr:.ADDRSS heap
heap:     .BYTE 0
          .END
