(require racket)

;; These are prefixes and are used to convert between different units.

(define prefixes '("t" "g" "M" "k" "" "m" "u" "n" "p" "f"))

(define time-prefixes '("s" "min" "hr" "day" "month" "yr"))

;; index-of function will return the position of the element in a given list.
;; This function is 0 indexed and will simply return false if list is empty.

(define (index-of lst ele)
  (let loop ((lst lst)
             (idx 0))
    (cond ((empty? lst) #f)
          ((equal? (first lst) ele) idx)
          (else (loop (rest lst) (add1 idx))))))

(index-of prefixes "k")

;; Converts the units from a given unit to another unit.
;; The from unit is the one that will be converted.
;; You can select the to argument.

(define (convert-units from to)
  (let* ([from-index (index-of prefixes from)]
         [to-index (index-of prefixes to)]
         [diff (- to-index from-index)]
         [factor (expt 10 (* 3 diff))])
    factor))

(convert-units "" "k")

;; Will convert to standard units.
;; si-unit needs split the units using a string split.

(define (si-unit current)
  (if (num? current)
      (let* ([units (num-units current)])
        (if (eq? "" units)
            (current)
            (let* ([factor (convert-units units "")]
                   [new-value (* factor (num-value current))])
              (num new-value ""))))
      (print "False")))

(num-value (si-unit a))


(define a (num 30 "g"))
