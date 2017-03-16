(require racket)

;; Accept optional parameters that take in values and determine the equation to be used.
;; list out all of the equations.

(define charge-of-electron 1.6e-19)
(define e0 8.8e-12)
(define earth-preasure 1.01e5)
(define g 9.81)


;; Without the pressure of the earth's atmosphere.
(define (gauge-pressure density g h)
  (* density g h))

(define (parse-data str)
  (let* ([x    (string-split str " ")]
         [data (num (string->number (first x)) (second x))])
    (num-value data)))

(struct num (value units))

(define data (num 10 "kg"))


(define (mul . rest)
  (let* ([
          result (apply * rest)])))

(apply num? (num "10" "kg") (num "10" "kg"))

(mul 1 2 3)
(parse-data "10 kg")







(parse-data "12.9 kg")




(define (electric-flux #:electric-potential E #:area A)
  (cond ))

(define (kinetic-energy #:mass (m 70) #:velocity v)
  (* 0.5 m (* v v)))

(define (force #:mass (m 70) #:acceleration (a acc-on-earth))
  (* m a))



(force)

(kinetic-energy #:velocity 5)
