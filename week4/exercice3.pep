                 LDX         ltab,i   ; PARAM X = Array length
                 call        remplir

                 LDX         ltab,i   ; PARAM X = Array length
                 call        afficher

                 STOP


; Remplir tableau
; PARAMS:
;                X = Array length
remplir:         STRO        st1,d    ; Demander a l'utilisateur d'entrer 5 nombres
                 CHARO       '\n',i   ; Imprime une ligne vide
loop1:           DECI        tab,x    ; Entrer une valeur dans le tableaudf
                 SUBX        2,i      ; Réduire X
                 ADDA        1,i
                 CPX         0,i   ; Comparer à la longueur du tableau
                 BRLE        endlp1   ; Terminer la loop
                 BR          loop1    ; Loop encore
endlp1:          RET0                 ; Terminer le chargement du tableau


; Afficher tableau
; PARAMS:
;                X = Array length
afficher:        STRO        st2,d    ; Imprime quon va afficher le tableau
                 CHARO       '\n',i   ; Imprime une ligne vide
loop2:           DECO        tab,x    ; Afficher le contenu
                 CHARO       ',',i    ; Séparer de virgules
                 SUBX        2,i      ; Réduire X
                 CPX         0,i   ; Comparer à la longueur du tableau
                 BRLE        endlp2   ; Fin de la loop
                 BR          loop2
endlp2:          RET0



; Variables
ltab:   .EQUATE 10
tab:    .BLOCK  10
st1:     .ASCII  "Please enter 5 numbers:\x00"
st2:     .ASCII  "Displaying array:\x00"

.END
