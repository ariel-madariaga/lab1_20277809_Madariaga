#lang racket
;exportacion de funciones

(provide construcZonas)
(provide zonas2)
(provide zonas)
(provide lista?)
(provide workspace)
(provide index)
(provide localRepository)
(provide remoteRepository)

;TDA zonas de trabajo

;-----representacion-----:

;(list (list (string (...)) list(string (...)) list(string (...)) list(string (...)))
;la primera lista de string se representara como el workspace, la segunda el index, la tercera el localRepository y la cuarta el remoteRepository.
; Los (...) se refiere a posibles mas string en la lista.

;zonas se definira como una constante que puede tener contenido (strings) o puede estar vacia.
;con los modificadores y constructores se podra manipular.

(define zonas (list '() '() '() '()))

;-----pertenencia-----:

;descripcion: verificar si pertenece a una lista.
;dominio: lista de elementos.
;recorrido: booleano.
;tipo de recursion: no tiene.

(define (lista? lista)
  (if(list? lista)
     #t
     #f))

;-----constructores-----:

;descripcion: Crear las zonas dependiendo del parametro "listas" ingresado en caso de ingresar el car de zonas
             ;creara el repositorio workspace y asi para las siguientes zonas definidas en la representacion
;dominio: lista de strings o vacia.
;recorrido: lista de strings o vacia(representando a cada zona ingresada).
;tipo de recursion: recursion natural.

(define construcZonas (lambda  (listas)
                        (if (null? listas)
                            (list)
                            (if (lista? (car listas))
                                (list)
                                (cons (car listas) (construcZonas (cdr listas)))))))



;-----selectores-----:

;descripcion: obtener el workspace del TDA zonas.
;dominio: TDA zonas de trabajo.
;recorrido: lista de string (workspace).
;tipo de recursion: no tiene.
(define (workspace)
  (car zonas))

;descripcion: obtener el index del TDA zonas.
;dominio: TDA zonas de trabajo.
;recorrido: lista de string (index).
;tipo de recursion: no tiene.
(define (index)
  (cadr zonas))

;descripcion: obtener el localRepository del TDA zonas.
;dominio: TDA zonas de trabajo.
;recorrido: lista de string (localRepository).
;tipo de recursion: no tiene.
(define (localRepository)
  (caddr zonas))

;descripcion: obtener el remoteRepository del TDA zonas.
;dominio: TDA zonas de trabajo.
;recorrido: lista de string (remoteRepository).
;tipo de recursion: no tiene.
(define (remoteRepository)
  (cadddr zonas))

;-----modificadores-----:

;descripcion: crea una copia de zonas la cual se podra modificar.
;dominio: zonas de trabajo.
;recorrido: copia de zonas(lista de listas).
;recursion: no tiene.

(define (zonas2 workspace2 index2 localRepository2 remoteRepository2)
                 (list (construcZonas workspace2)
                       (construcZonas index2)
                       (construcZonas localRepository2)
                       (construcZonas remoteRepository2)))





