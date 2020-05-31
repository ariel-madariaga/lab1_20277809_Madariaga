#lang racket
;-----exportacion-----:

(provide pull)

;-----importacion-----:

(require "TDA_Zonas.rkt")
(require "Funcion_Para_Pull.rkt")
(require "TDA_Commit.rkt")

;----------funciones------------

;-----funcion PULL-----:

;descripcion: funcion que recibe una lista de listas de strings o vacias y entrega como resultado
             ;una lista con todos los cambios desde el remoteRepository(lista de strings) al workspace(lista de strings).
;dominio:lista de listas de strings o vacias.
;recorrido: lista de strings o vacia.
;recursion: recursion natural.


(define (pull zonas)
  ;pregunta si es un commit.
  (if(esCommit? (cadddr zonas))
     ;caso que si es un commit
     (if(null? (cadddr zonas));se pregunta si el remote es vacio.
        ;caso que si es vacio.
        (zonas2 (workspace) (index) (localRepository) null)
        ;caso que no es vacio el remote.
        ;se pregunta si los archivos del remoteRepository esta vacio.
        (if(null? (listaArchivos (cadddr zonas)))
           ;caso que si esta vacio la lista del remoteRepository.
           (zonas2 (car zonas) (index) (localRepository) (remoteRepository))
           ;caso que no esta vacia la lista del remoteRepository, se pregunta si el workspace esta vacio.
           (if(null? (car zonas))
              ;caso que si esta vacio el workspace.
              (if(null? (listaArchivos (cadddr zonas)))
                 ;caso que no quedan mas elementos.
                 null
                 ;caso que el workspace esta vacio y el remote no.
                 (if(verificar (workspace) (listaArchivos (cadddr zonas)));se verifica si el primer elemento del remote esta en el workspace y asi con todos los del remote.
                    ;caso que si se encuentra el elemento en el workspace.
                    ;se pregunta si quedan mas elementos en el remoteRepository.
                    ;caso que si quedan mas elementos.
                    (zonas2 (car(pull (zonas2 (car zonas) (index) (localRepository) (cons (car(remoteRepository)) (list (cdr(listaArchivos (cadddr zonas)))))))) (index) (localRepository) (remoteRepository));llamado recursivo con la cola del remote.
                    ;caso que no se encuentra el elemento en el workspace.
                    (zonas2 (cons (car(listaArchivos (cadddr zonas))) (car(pull (zonas2 (car zonas) (index) (localRepository) (cons (car(remoteRepository)) (list (cdr(listaArchivos (cadddr zonas))))))))) (index) (localRepository) (remoteRepository))));se construye la cabeza del remote con el llamado recursivo de la cola de este mismo.
              ;caso que el workspace no esta vacio.
              (zonas2 (cons (car(car zonas)) (car(pull (zonas2 (cdr(car zonas)) (index) (localRepository) (remoteRepository))))) (index) (localRepository) (remoteRepository)))));se escribe el workspace completo.
     ;caso que no es commit se entrega el workspace sin cambios y el remote vacio.
     (zonas2 (workspace) (index) (localRepository) null))) 
            


