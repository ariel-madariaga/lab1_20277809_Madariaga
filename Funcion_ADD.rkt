#lang racket

;exportaciones

(provide addF)
(provide add)

;-------importaciones------:
(require "TDA_Commit.rkt")
(require "TDA_Zonas.rkt")
(require "Funcion_Para_Pull.rkt")
(require "Funcion_PULL.rkt")
(require "Funcion_de_ADD.rkt")

;------funciones------:

;----funcion addF----:

;descripcion: funcion currificada auxiliar de add que retorna
             ;una lista con el resultado de add pero con dos parametros agregados.
;dominio: listas y lista de listas.
;recorrido: lista.
;recursion: de cola.

(define ((addF lista lista2 lista3) zonas)
  (if(null? lista)
     (borrar lista3 lista2)
     (if(verificar (car(pull zonas)) lista)
        ((addF (cdr lista) lista2 lista3) zonas)
        ((addF (cdr lista) (revertir (list lista2 (car lista))) lista3)zonas))))

;----funcion add----:

;descripcion: funcion add que es la copia de addF implementada anteriormente por lo que
             ;en esta funcion no aplica recursion pero al ser la copia de addF se asume recursion de cola tambien.
;dominio: lista y lista de listas.
;recorrido: lista.
;recursion: "no tiene".

(define ((add lista) zonas)
 (if(null? lista)
    (zonas2 (car(pull zonas)) (index) (localRepository) (remoteRepository))
    (zonas2 (car(pull zonas)) ((addF lista lista lista)zonas) (localRepository) (remoteRepository))))




