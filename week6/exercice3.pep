         ; Create a
         LDA     a_size,i
         call    malloc
         STX     a,d

         ; set_val
         LDA     10,i
         LDX     a,d
         call    set_val

         ; get_val
         SUBSP   2,i         ; make room for tmp variable
         LDX     a,d         ; X = Address of A
         call    get_val     ; call get_val
         STA     0,s         ; store return value in tmp variable
         DECO    0,s         ; output return variable
         ADDSP   2,i         ; free tmp variable
         CHARO   '\n',i

         ; Create b
         LDA     a_size,i
         call    malloc
         STX     b,d

         ; set_other
         LDA     a,d
         LDX     b,d
         call    set_o

         ; get_other
         LDX     b,d
         call    get_o
         SUBSP   2,i
         STA     0,s
         LDX     0,x
         call    get_val
         STA     0,s
         DECO    0,s
         ADDSP   2,i

         STOP

; Params:
;    X: A
get_val: ADDX    a_value,i
         LDA     0,x
         RET0

; Params:
;    A: value
;    X: A
set_val: ADDX    a_value,i
         STA     0,x
         RET0

; Params:
;    A: other
;    X: A
set_o:   ADDX    a_other,i
         STA     0,x
         RET0

; Params:
;    X: A
get_o:   ADDX    a_other,i
         LDA     0,x
         RET0

a:       .WORD   0
b:       .WORD   0

a_size:  .EQUATE 4
a_value: .EQUATE 0
a_other: .EQUATE 2

; Allocates 'n' bytes in the Heap
;
; Params:
;     * Register A: 'n' bytes to allocate
; Returns:
;     * Register X: Address of the allocated block
malloc:  LDX    heap_ptr, d
         ADDA   heap_ptr, d
         STA    heap_ptr, d
         RET0
heap_ptr:.ADDRSS heap
heap:     .BYTE 0
          .END