#lang racket


;exportaciones

(provide construcCommit)
(provide esCommit?)
(provide nombreCommit)
(provide listaArchivos)



;------tda commit------:

;representacion:(lista(string (lista (string (...)))))
                ;la representacion de un commit es una lista que en su primera posicion tendra el nombre del commit
                ;y en su segunda posicion tendra una lista que tendra los archivos(strings) del commit

;pertenencia:

;descripcion: pregunta si la lista tiene como primer elemento un string y como segundo elemento una lista.
;dominio: lista de un string y una lista de strings.
;recorrido: booleano.
;recursion:no tiene.
(define (esCommit? lista)
  (if(null? lista)
     list
     (if(string? (car lista))
        (if(list? (cadr lista))
           #t
           #f)
        #f)))

;constructores:

;descripcion: funcion que construye un commit.
;dominio: lista de un string y una lista de strings.
;recorrido: lista de un string y una lista de strings.
;recursion:no tiene.
(define (construcCommit lista)
  (if(null? lista)
     (list)
     (if(esCommit? lista)
        lista
        (list))))

;selectores:

;descripcion: guarda el primer elemento de una lista.
;dominio: lista de un string y una lista de strings.
;recorrido: lista de string.
;recursion: no tiene.
(define (nombreCommit construcCommit)
  (car construcCommit))

;descripcion: guarda el segundo elemento de una lista.
;dominio: lista de un string y una lista de strings.
;recorrido: lista de lista de strings.
;recursion: no tiene.
(define (listaArchivos construcCommit)
  (cadr construcCommit))