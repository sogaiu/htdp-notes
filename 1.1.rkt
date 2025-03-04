#lang htdp/bsl

(require tests/eli-tester)

;; 1.1 the arithmetic of numbers

;; 1.1 exercise 1
;;
;; Add the following definitions for x and y to DrRacket’s
;; definitions area.

(define x 3)

(define y 4)

;; Now imagine that x and y are the coordinates of a Cartesian
;; point. Write down an expression that computes the distance
;; of this point to the origin, that is, a point with the
;; coordinates (0,0).

(test

  (sqrt (+ (sqr (- x 0))
           (sqr (- y 0))))
  =>
  5

  )

;; 1.1 exercise 1 continued
;;
;; To confirm that the expression works properly, change x to
;; 12 and y to 5, then click RUN. The result should be 13.
;;
;; XXX: following the instructions precisely doesn't
;;      appear to allow us to keep all steps of the
;;      exercise in one file.  at least, it's not obvious
;;      how to do it.  as a work-around, use x1 and y1
;;      instead of x and y.

(define x1 12)

(define y1 5)

(test

  (sqrt (+ (sqr (- x1 0))
           (sqr (- y1 0))))
  =>
  13

  )
