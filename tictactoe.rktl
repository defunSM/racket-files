#lang slideshow

(require pict)

(rectangle 100 100 "solid" "red")

(define (square size color)
  (filled-rectangle size size
                    #:color color
                    #:border-color "white"))



(define (white-hline)
  (linewidth 3 (colorize (hline 500 5) "white")))

(define (white-hline2)
  (linewidth 3 (colorize (hline 500 800) "white")))

(define (white-vline)
  (linewidth 3 (colorize (vline 500 400) "white")))

(define (white-vline2)
  (linewidth 3 (colorize (vline 0 400) "white")))

(white-vline2)

(rt-superimpose (lt-superimpose (rtl-superimpose (cc-superimpose (white-hline) (white-vline)) (white-hline)) (white-vline2)) (white-hline2))

(white-vline)

(vc-append 40 (white-hline) (white-hline))

(pin-over (white-hline)
          100 100
          (white-vline))

(vc-append (circle "solid" "blue")
           (circle "solid" "yellow"))

(filled-rectangle 40 40 #:color "red")



(square 100 "solid" "red")

(dc (λ (dc dx dy)
      (define old-brush (send dc get-brush))
      (define old-pen (send dc get-pen))
      (send dc set-brush
            (new brush% [style 'fdiagonal-hatch]
                 [color "darkslategray"]))
      (send dc set-pen
            (new pen% [width 3] [color "slategray"]))
      (define path (new dc-path%))
      (send path move-to 0 0)
      (send path line-to 50 0)
      (send path line-to 25 50)
      (send path close)
      (send dc draw-path path dx dy)
      (send dc set-brush old-brush)
      (send dc set-pen old-pen))
    50 50)
