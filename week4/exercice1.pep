call remplir

STOP


; Remplir Tableau
remplir:         STRO        st1,d    ; Demander a l'utilisateur d'entrer 5 nombres
                 CHARO       '\n',i   ; Imprime une ligne vide
                 LDX         0,i      ; Charger 0 dans X comme index du tableau
loop1:           DECI        tab,x    ; Entrer une valeur dans le tableau
                 ADDX        1,i      ; Incrémenter X
                 CPX         ltab,i   ; Comparer à la longueur du tableau
                 BRGE        endlp1   ; Terminer la loop
                 BR          loop1    ; Loop encore
endlp1:          RET0                 ; Terminer le chargement du tableau


; Variables
ltab:   .EQUATE 5
tab:    .BLOCK  5
st1:     .ASCII  "Please enter 5 numbers:\x00"

.END
