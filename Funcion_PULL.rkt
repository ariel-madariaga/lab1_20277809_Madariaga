#lang racket
;importacion

(require "TDA_Zonas.rkt")
(require "Funcion_Para_Pull.rkt")

;----------funciones------------

;-----funcion PULL-----:

;descripcion: funcion que recibe una lista de listas de strings o vacias y entrega como resultado
             ;una lista con todos los cambios desde el remoteRepository(lista de strings) al workspace(lista de strings).
;dominio:lista de listas de strings o vacias.
;recorrido: lista de strings o vacia.
;recursion: recursion natural.

(define (pull zonas)
  ;se pregunta si el remoteRepository esta vacio.
  (if(null? (cadddr zonas))
     ;caso que si esta vacio el remoteRepository.
     (car zonas)
     ;caso que no esta vacio el remoteRepository, se pregunta si el workspace esta vacio.
     (if(null? (car zonas))
        ;caso que el workspace esta vacio y el remote no.
        (if(verificar (workspace) (cadddr zonas));se verifica si el primer elemento del remote esta en el workspace y asi con todos los del remote.
           ;caso que si se encuentra el elemento en el workspace.
           ;se pregunta si quedan mas elementos en el remoteRepository.
           (if(null? (cdr(cadddr zonas)))
              ;caso que no quedan mas elementos.
              null
              ;caso que si quedan mas elementos.
              (and (cdr (workspace)) (pull (zonas2 (car zonas) (index) (localRepository) (cdr(cadddr zonas))))));llamado recursivo con la cola del remote.
           ;caso que no se encuentra el elemento en el workspace.
           (cons (car(cadddr zonas)) (pull (zonas2 (car zonas) (index) (localRepository) (cdr(cadddr zonas))))));se construye la cabeza del remote con el llamado recursivo de la cola de este mismo.
        ;caso que el workspace no esta vacio.
        (cons (car(car zonas)) (pull (zonas2 (cdr(car zonas)) (index) (localRepository) (cadddr zonas)))))));se escribe el workspace completo.