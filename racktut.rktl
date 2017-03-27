;; A tutorial for racket for blog post.

;; Needed to specify the language.
(require racket)

;; Addition similiar to clojure and other lisps
(+ 2 2)

;; accepts more than one argument thats good.
(+ 2 2 3)

;; That works too.
(+ 3 (* 2 2))

;; What happens when mixing with floats. Oh a float or racket calls them inexact numbers.

(inexact? (+ 3 (* 2.0 2)))

;; How do we print strings now lets try println. Same as clojure.

(println "Hello")

;; Do they have format? or something to concat strings? ~a
(~a "2+2=" (+ 2 2))

;; How do you define a top level variable in racket?
(define x 10)

x ;; 10

;; local variable within a scope.
;; Notice that x is 3 in that specific scope not 10.
(let [(x 3)] x)

;; just to check that x is actually still globally defined as 10.
x ;; still 10 cool.

;; Now how do you make a function? With define as well.
(define (greetings name)
  (~a "Hello, " name "!"))

(greetings "salman") ;; Yep works.

;; Oh it doesn't matter if you make them parantheses or brackets.

(define [greetings name]
  (~a "Hello, " name "!"))

(greetings "salman") ;; still works.

;; What about the lambda functions?

((lambda (x) (* x x)) 10)

;; lists? Either way works they have the short hand way and the quote function.

(quote (1 2 3 4))

'(1 2 3 4)

;; Now how do I map functions to individual elements in a list.
;; Oh they have map.

(map (lambda (x) (* x x)) '(1 2 3 4))

;; Booleans
;; Racket uses #t and #f for true and false.

(= 2 (+ 1 1))
(= 2 (+ 1 2))

;; if statements in racket
;; First part is the conditional which is the (= 2 (+ 1 1)) which is #t
;; Second part is (println "True") which is the true branch that'll execute if the condition is met.
;; Third part (println "False") is the false branch which won't be executed.

(if (= 2 (+ 1 1))
    (println "True")
    (println "False"))

;; Notice that and will return true if nothing provided.
;; and is #t if no arguments provided.
;; or is #f is no arguments provided.
;; and  will return the argument if only one argument is provided.
;; or will do the same if one argument is provided.

(define a 10)
(define b 5)

(and)
(and 1)

(or)
(or 2)

(and (even? a) (odd? b))
(and (odd? a) (odd? b))
(or (odd? a) (odd? b))

;; Conditionals in racket
;; Must start with a bracket to start a conditional.
;; Than there is the testing condition and if its met executes.

(cond
  [(positive? n) (println "This number is positive")]
  [(negative? n) (println "This number is negative")])


;; There is also an else if not of the conditionals are met.
;; Tells us if the quadradic has 2 roots, 1 root or imaginary roots.
(define (roots a b c)
  (let ([discriminant (- (expt b 2) (* 4 a c))])
    (cond
        [(positive? discriminant) (println "This quadradic has 2 roots")]
        [(negative? discriminant) (println "This quadradic has imaginary roots")]
        [else (println "This quadradic has 1 root")])))

;; Also note that racket makes a distinction between let and let* like in lisp.
;; let won't allow you to use previous bindings as you would sometimes expect.
;; let* however does let you use previous bindings.
;; First one with let will provide an error because of the difference between let and let*
;; You'll find that num is undefined in the first one. Second one works fine.

(let [(num 10)
      (result (+ 2 num))]
  result)

(let* [(num 10)
       (result (+ 2 num))]
  result)

;; Apply which will distribute the prodecure across the list.
;; Notice that the last argument for apply must be a list.

(apply * '(1 2 3 4))

(apply * 1 2 '(3 4))

(apply * 1 2 3 '(4))

(apply * 1 2 3 4) ;; error: contract violation
