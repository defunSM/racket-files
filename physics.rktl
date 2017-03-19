(require racket)

;; Accept optional parameters that take in values and determine the equation to be used.
;; list out all of the equations.

(define charge-of-electron 1.6e-19)
(define e0 8.8e-12)
(define earth-preasure 1.01e5)
(define g 9.81)

;; These are prefixes and are used to convert between different units.

(define prefixes '("t" "g" "M" "k" "h" "da" "d" "c" "m" "u" "n" "p" "f"))

;; index-of function will return the position of the element in a given list.
;; This function is 0 indexed and will simply return false if list is empty.

(define (index-of lst ele)
  (let loop ((lst lst)
             (idx 0))
    (cond ((empty? lst) #f)
          ((equal? (first lst) ele) idx)
          (else (loop (rest lst) (add1 idx))))))

(index-of prefixes "k")


;; Without the pressure of the earth's atmosphere.
(define (gauge-pressure density g h)
  (* density g h))

(define (parse-data str)
  (let* ([x    (string-split str " ")]
         [data (num (string->number (first x)) (second x))])
    (num-value data)))

(struct num (value units))

(define data (num 10 "kg"))


;; Continue to work on this so that units can be multiplied.

(define (mul . rest)
  (let* ([result (apply * rest)])
    result))

(num-value (num 10 "kg"))

(define (collect* func mylist)
  (map (lambda (i) (func (eval i))) mylist))


(define mylist '((num 10 "kg") (num 20 "kg")))

(collect* num-units mylist)

(map (lambda (x) (num-value (eval x))) '((num 10 "kg") (num 20 "kg")))

()


(define (divide . rest)
  (let* ([result (apply / rest)])
    result))



(map num-value '((num "10" "kg")))

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
