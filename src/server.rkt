#lang racket
(require racket/tcp)
(require json)

(define (response)
  (jsexpr->string (hash 'a "b"
                        'c "d")))

(define (handle in out)
  (displayln "Entered handle")
  (let ([line (read-line in 'any)])
    (displayln "In let, got data:")
    (displayln line)
    (displayln (string->jsexpr line))
    (displayln (response))
    (displayln (response) out)))

(define (accept-and-handle listener)
  (displayln "Entered accept-and-handle")
  (define-values (in out) (tcp-accept listener))
  (handle in out)
  (close-input-port in)
  (close-output-port out))

(define (serve port-no)
  (define listener (tcp-listen port-no 5 #t))
  (define (loop)
    (displayln "In wait loop")
    (accept-and-handle listener)
    (loop))
  (loop))

(serve 8000)
