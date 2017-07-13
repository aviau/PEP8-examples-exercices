                 LDA         ltab,i   ; PARAM A = Array length
                 call        remplir

                 LDA         ltab,i   ; PARAM A = Array length
                 call        afficher

                 STOP


; Remplir tableau
; PARAMS:
;                A = Array length
remplir:         STRO        st1,d    ; Demander a l'utilisateur d'entrer 5 nombres
                 CHARO       '\n',i   ; Imprime une ligne vide
                 LDX         0,i      ; Charger 0 dans X comme index du tableau
loop1:           DECI        tab,x    ; Entrer une valeur dans le tableau
                 ADDX        2,i      ; Incrémenter X
                 CPX         ltab,i   ; Comparer à la longueur du tableau
                 BRGE        endlp1   ; Terminer la loop
                 BR          loop1    ; Loop encore
endlp1:          RET0                 ; Terminer le chargement du tableau


; Afficher tableau
; PARAMS:
;                A = Array length
afficher:        STRO        st2,d    ; Imprime quon va afficher le tableau
                 CHARO       '\n',i   ; Imprime une ligne vide
                 LDX         0,i      ; Charger 0 dans X comme index du tableau
loop2:           DECO        tab,x    ; Afficher le contenu
                 CHARO       ',',i    ; Séparer de virgules
                 ADDX        2,i      ; Incrémenter X
                 CPX         ltab,i   ; Comparer à la longueur du tableau
                 BRGE        endlp2   ; Fin de la loop
                 BR          loop2
endlp2:          RET0



; Variables
ltab:   .EQUATE 10
tab:    .BLOCK  10
st1:     .ASCII  "Please enter 5 numbers:\x00"
st2:     .ASCII  "Displaying array:\x00"

.END
