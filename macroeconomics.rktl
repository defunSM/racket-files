;; Macro Economics

(require racket)

(define (CPI curr-price base-price)
  (* (/ curr-price base-price) 100))

(apply * '(1 2 3))

(define (college-func n rate)
  (/ (* n (expt rate n)) (- (expt 1.1 n) 1)))

(college-func 4 1.1)

(define (college-func-with-debt n rate initial (debt 0))
  (/ (+ (* n (expt rate n) initial) debt) (- (* (expt 1.1 n) initial) initial)))

(college-func-with-debt 4 1.1 19000 30000)


;; to do later.
(define (college-func-with-debt-2 n rate initial final (debt 0))
  )
