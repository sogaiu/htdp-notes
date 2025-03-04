#lang htdp/bsl

(require tests/eli-tester)

;; 1.7 predicates: know thy data

;; 1.7 unnamed (1)
;;
;; Experiment with this expression by entering it both into
;; DrRacket’s interactions area and in the definitions area
;; (and then click on RUN).

(test

   (* (+ (string-length 42) 1) pi)
   =>
   (error (string-append "string-length: contract violation\n"
                        "  expected: string?\n"
                        "  given: 42"))
  )

;; 1.7 unnamed (2)
;;
;; Experiment with number?, string?, image?, and boolean? to
;; ensure that you understand how they work.

(require 2htdp/image)

(test

  (number? 5)
  =>
  #true

  (number? #false)
  =>
  #false

  (string? 9)
  =>
  #false

  (string? "hello")
  =>
  #true

  (image? 1)
  =>
  #false

  (image? (square 10 "solid" "green"))
  =>
  #true

  (boolean? #false)
  =>
  #true

  (boolean? 10)
  =>
  #false

  )

;; 1.7 unnamed (3)
;;
;; Put (sqrt -1) at the prompt in the interactions area and hit
;; the “enter” key.

(test

  (sqrt -1)
  =>
  0+1i

  )

;; 1.7 unnamed (4)
;;
;; For now, experiment with exact? and inexact? to make sure they
;; perform the checks that their names suggest.

(test

  (exact? 1)
  =>
  #true

  (inexact? (sqrt 2))
  =>
  #true

  (exact? (/ 1 3))
  =>
  #true

  (exact? (/ 2.0 3.0))
  =>
  #true

  )

;; 1.7 exercise 9
;;
;; Add the following line to the definitions area of DrRacket:

(define in "hello")
;(define in (square 10 "solid" "blue"))
;(define in -100)
;(define in #true)
;(define in #false)

;; Then create an expression that converts the value of in to a
;; non-negative number. For a String, it determines how long the
;; String is; for an Image, it uses the area; for a Number, it
;; uses the absolute value; for #true it uses 10 and for #false 20.

(cond
  [(string? in)
   (string-length in)]
  [(image? in)
   (* (image-width in) (image-height in))]
  [(number? in)
   (abs in)]
  [(eq? #true in)
   10]
  [(eq? #false in)
   20])

;; 1.7 exercise 10
;;
;; Now relax, eat, sleep, and then tackle the next chapter.
