#lang slideshow

(colorize (circle 100) "red")

(circle 300 "solid" "red" "outline" "blue")

(require 2htdp/image)

(define c (circle 10))
(define r (rectangle 10 20))

(define (square n)
  (filled-rectangle n n))

(define (four p)
  (define two-p (hc-append p p))
  (vc-append two-p two-p))

(four (circle 50) "yellow")

(define (checker p1 p2)
  (let ([p12 (hc-append p1 p2)]
        [p21 (hc-append p2 p1)])
    (vc-append p12 p21)))

(checker (colorize (square 40) "red")
         (colorize (square 40) "black"))

(define (checkerboard p)
  (let* ([rp (colorize p "red")]
         [bp (colorize p "black")]
         [c (checker rp bp)]
         [c4 (four c)])
    (four c4)))

(checkerboard (square 40))

(define (series mk)
  (hc-append 4 (mk 10) (mk 25) (mk 45)))

(series circle)

(series (lambda (size) (checkerboard (square size))))

(define (rgb-series mk)
  (vc-append
   (series (lambda (sz) (colorize (mk sz) "red")))
   (series (lambda (sz) (colorize (mk sz) "green")))
   (series (lambda (sz) (colorize (mk sz) "blue")))))

(rgb-series square)

(define (rgb-maker mk)
  (lambda (sz)
    (vc-append
     (colorize (mk sz) "red")
     (colorize (mk sz) "green")
     (colorize (mk sz) "blue"))))

(series (rgb-maker square))


(list (circle 10) (square 10))

(define (rainbow p)
  (map (lambda (color)
         (colorize p color))
       (list "red" "orange" "yellow" "green" "blue" "purple")))

(rainbow (square 25))

(apply vc-append (rainbow (square 25)))

(require pict/flash)

(colorize (filled-flash 40 30) "red")

(require slideshow/code)

(code (circle 10))

(define-syntax pict+code
  (syntax-rules ()
    [(pict+code expr)
     (hc-append 10
                expr
                (code expr))]))

(pict+code (colorize (square 30) "red"))

(require racket/class
         racket/gui/base)

(define f (new frame%
               [label "My art"]
               [width 300]
               [height 300]
               [alignment '(center center)]))

(send f show #t)

(define (add-drawing p)
  (let ([drawer (make-pict-drawer p)])
    (new canvas%
         [parent f]
         [style '(border)]
         [paint-callback (lambda (self dc)
                           (drawer dc 0 0))])))

(add-drawing (colorize (filled-flash 50 30) "yellow"))

(square 100 "solid" "red")

(map (lambda (x) (square (sq x) "solid" "red")) '(3 6 9 12))

(line 1000 0 "red")

(define (go)
  'yep-it-works)

(go)

(map * '(1 2 3) '(4 5 6))

(define (dot a b)
  (map * a b))

(define (sq n)
  (* n n))

(define (magnitude a)
  (map square a))

(dot '(1 2 3) '(4 5 6))

(require plot)
(require math)

(parameterize ([plot-width 640]
               [plot-height 480]
               [plot-x-label #f]
               [plot-x-label #f]
               [plot-new-window? #t])
  (list (plot (function sin (- pi) pi))
        (plot (function sqr -2 2))))

(plot (lines
       (reverse
        (for/fold ([lst (list (vector 0 0))]) ([i  (in-range 1 200)])
          (match-define (vector x y) (first lst))
          (cons (vector i (+ y (* 1/100 (- (random) 1/2)))) lst)))
       #:color 6 #:label "Random walk"))

(expt 2 5)

(remainder 10 2)

(map (lambda (i) (remainder i 2)) (in-range 10))

(define (area-of-circle radius)
  (* pi (expt radius 2)))

(area-of-circle 10)

(define (area-of-ring outer in)
  (- (area-of-circle outer)
     (area-of-circle in)))

(area-of-ring 10 5)

(apply min '(1 10 20 30 4))

(for/sum ([x (in-range 11)]) x)

(for/list ([k (in-range 11)])
  k)


;; Trying to be like the range from clojure.

(define range
  (case-lambda
    [(end) (for/list ([k (in-range end)]) k)]
    [(start end) (for/list ([k (in-range start end)]) k)]
    [(start end step) (for/list ([k (in-range start end step)]) k)]))

(range 100 200 5)

(define salutation
  (let ([r (random 3)])
    (list-ref '("Hi" "Hello" "Greetings") r)))

(define (greet name)
  (string-append salutation ", " name))

(greet "Salman")

(error "None")

(null? '())
