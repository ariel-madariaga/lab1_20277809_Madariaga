#lang racket
;------exportaciones------:

(provide push)

;------importaciones------:

(require "TDA_Zonas.rkt")
(require "Funcion_Para_Pull.rkt")
(require "Funcion_PULL.rkt")
(require "Funcion_de_ADD.rkt")
(require "Funcion_ADD.rkt")
(require "Funcion_COMMIT.rkt")
(require "TDA_Commit.rkt")


;------funciones------:

;------funcion push------:

;descripcion: funcion currificada que escribe el commit creado en el remoteRepository
             ;pidiendo como parametros la lista y el nombre del commit incorporados en las funciones add y commit.
;dominio: lista de listas, lista y string.
;recorrido: lista de listas.
;recursion: no tiene.

(define (push zonas) (lambda(lista mensaje)
                       (if(null? (remoteRepository))
                          (zonas2 (car (pull zonas))
                                  (cadr ((add lista)zonas))
                                  (construcCommit (list mensaje (cadr((add lista)zonas))))
                                  (construcCommit (caddr(((commit mensaje) zonas)lista))))
                          (zonas2 (car (pull zonas))
                                  (cadr ((add lista)zonas))
                                  (cons (localRepository) (construcCommit (list mensaje (cadr((add lista)zonas)))))
                                  (cons (remoteRepository) (construcCommit (list mensaje (cadr((add lista)zonas)))))))))


