#lang racket

(provide git)

;----importaciones----:

(require "TDA_Zonas.rkt")
(require "Funcion_Para_Pull.rkt")
(require "Funcion_PULL.rkt")
(require "Funcion_de_ADD.rkt")
(require "Funcion_ADD.rkt")
(require "Funcion_PUSH.rkt")
(require "Funcion_COMMIT.rkt")
(require "TDA_Commit.rkt")


;------funciones------:

;------funcion git------:

;descripcion: funcion que recibe como parametro una funcion y entrega el resultado de dicha funcion.
;dominio: funcion.
;recorrido: funcion.
;recursion: no tiene.
(define (git comando) (lambda(zonas)
                        (comando zonas)))


