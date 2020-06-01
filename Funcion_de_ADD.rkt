#lang racket

;------exportaciones------

(provide revertir)
(provide borrar)

;-------modificadores-------:

;---funcion revertir---

;descripcion: funcion que hace un reverse de una lista.
;dominio: lista con elementos.
;recorrido: lista.
;recursion: natural.

(define(revertir lista)
   (if(null? lista)
       (list)
       (append (revertir (cdr lista)) (list (car lista)))))

;---funcion borrar---

;descripcion: funcion que elimina la ultima lista de una lista de listas.
;dominio: listas.
;recorrido: lista.
;recursion: natural.

(define(borrar lista lista2 )
  (if(equal? lista lista2)
     null
     (cons (car lista2) (borrar lista (cadr lista2)))))