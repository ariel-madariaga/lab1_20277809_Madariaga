#lang racket
;---exportacion de funcion---

(provide verificar)
(require "TDA_Commit.rkt")
(require "TDA_Zonas.rkt")

;------funcion para la funcion pull-------:


;descripcion: funcion que compara un string de una lista con cada string de otra lista y
             ;devuelve un #t en caso de que el string buscado este dentro de la otra lista y un #f en caso que no.
;dominio: dos listas de strings.
;recorrido: un booleano.
;recursion: recursion de cola.

(define (verificar lista lista2)
  ;se pregunta si la lista es null
  (if(null? lista)
     ;caso que la lista si es null, se retorna lista2 y #f.
     (and lista2 #f)
     ;caso que la lista no es vacia. se verifica elemento a elemento de la lista si se encuentra lista2.
     (if (equal? (car lista) (car lista2))
         #t
         (if(null? (cdr lista))
            #f
            (verificar (cdr lista) lista2)))))