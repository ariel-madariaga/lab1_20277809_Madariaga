#lang racket
;------exportaciones------:

(provide escribir)
(provide escribirCommit)

;------funciones------:

;descripcion: funcion que escribe una zona de trabajo de zonas en un string
;dominio: lista de string.
;recorrido: string.
;recursion: natural.
(define (escribir zona)
  (if (null? zona)
      "\n"
      (string-append (car zona) " " (escribir (cdr zona)))))

;descripcion: funcion que escribe un commit en un string
;dominio: lista de un string y una lista de string.
;recorrido: un string.
;recursion: no tiene.
(define (escribirCommit zona)
  (if (esCommit? zona)
      (if (null? zona)
          "\n"
          (string-append (car zona) " " (escribir (listaArchivos zona))))
      "no es commit"))