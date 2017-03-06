#lang slideshow

(colorize (circle 100) "red")

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

(define (go)
  'yep-it-works)

(go)
