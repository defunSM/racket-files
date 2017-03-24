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
(define (catch-up-salary n c1 c2 (debt 0))
  (/ (+ (* n c1) debt) (- c1 c2)))

(* 1.0 (catch-up-salary 4 24000 19000 30000))

(define (sigma f a b)
  (if (= a b)
      0
      (+ (f a) (sigma f (+ a 1) b))))

(time (round (sigma (lambda (x) (/ 1 x)) 1 2000)))
