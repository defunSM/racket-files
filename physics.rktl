(require racket)

;; Accept optional parameters that take in values and determine the equation to be used.

(define charge-of-electron 1.6e-19)
(define mass-of-electron 8.) ;; define this later
(define e0 8.8e-12)

(define acc-on-earth 9.81)

(define (electric-flux #:electric-potential E #:area A)
  (cond ))

(define (kinetic-energy #:mass (m 70) #:velocity v)
  (* 0.5 m (* v v)))

(define (force #:mass (m 70) #:acceleration (a acc-on-earth))
  (* m a))

(force)

(kinetic-energy #:velocity 5)
