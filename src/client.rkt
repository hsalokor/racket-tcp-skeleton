#lang racket
(require racket/tcp)
(require json)

(define (payload)
  (jsexpr->string (hash 'q "x"
                        'b "d")))

(define (send-and-receive)
  (define-values (in out) (tcp-connect/enable-break "127.0.0.1" 8000))
  (displayln (payload))
  (displayln (payload) out)
  (display "\n\n" out)
  (displayln (payload) out)
  (displayln (read-line in)))

(send-and-receive)
