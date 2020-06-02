#lang racket

;importaciones

(require "TDA_Zonas.rkt")
(require "Funcion_Para_Pull.rkt")
(require "Funcion_PULL.rkt")
(require "Funcion_de_ADD.rkt")
(require "Funcion_ADD.rkt")
(require "Funcion_PUSH.rkt")
(require "Funcion_COMMIT.rkt")
(require "TDA_Commit.rkt")
(require "Funciones_de_zonas-string.rkt")

;------funcion zonas->string------:

;descripcion: Escribe las zonas de trabajo en un string donde cada zona esta separada por un salto de linea.
;dominio: lista de listas de strings.
;recorrido: un string.
;recursion: no tiene.
(define (zonas->string zonas)
  (string-append (string-append "Los nombres de los archivos de workspace son" " " (escribir (car zonas)))
                 (string-append "Los nombres de los archivos de index son" " "(escribir (cadr zonas)))
                 (string-append "El nombre del commit y los archivos del localRepository son" " " (escribirCommit (caddr zonas)))
                 (string-append "El nombre del commit y los archivos del remoteRepository son" " " (escribirCommit (cadddr zonas)))))

(display (zonas->string zonas))