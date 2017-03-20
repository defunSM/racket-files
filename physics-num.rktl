(require racket)

;; A struct created to assign units to numbers.
;; num-value will return the integer of the num.
;; num-units will return the units of the num which is of type string.

(struct num (value units))
