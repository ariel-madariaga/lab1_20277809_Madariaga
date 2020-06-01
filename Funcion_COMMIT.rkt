#lang racket
;------exportaciones------:

(provide commit)

;------importaciones------:

(require "TDA_Zonas.rkt")
(require "Funcion_Para_Pull.rkt")
(require "Funcion_PULL.rkt")
(require "Funcion_de_ADD.rkt")
(require "Funcion_ADD.rkt")
(require "TDA_Commit.rkt")

;-------funciones-------:

;------funcion add------:

;descripcion: funcion que crea un commit y lo retorna como una lista donde el primer elemento
             ;de la lista es el nombre del commit(string) y lo siguiente una lista con los archivos que contiene el commit.

;dominio: un string(mensaje), lista de listas(zonas) y una lista.
;recorrido: lista de listas.
;recursion: no tiene.

(define ((commit mensaje) zonas) (lambda(lista)
                                   (if(null? (localRepository))
                                      (zonas2 (car(pull zonas))
                                              (cadr((add lista)zonas))
                                              (construcCommit (list mensaje (cadr((add lista)zonas))))
                                              (remoteRepository))
                                      (zonas2 (car(pull zonas))
                                              (cadr((add lista)zonas))
                                              (cons (localRepository) (construcCommit (list mensaje (cadr((add lista)zonas)))))
                                              (remoteRepository)))))
