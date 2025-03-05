#lang htdp/bsl

(require tests/eli-tester)

;; 2.2 computing

;; 2.2 unnamed
;;
;; Enter the definition of ff into the definitions area.
;; Add (ff (+ 1 1)) at the bottom.

(define (ff a)
  (* 10 a))

;; Now click the STEP.
;; ...
;; Watch how the stepper performs the same calculations as we do.

;; XXX: in lieu of the stepper, spelled out the steps

(test

  (ff (+ 1 1))
  =>
  (ff 2)

  (ff 2)
  =>
  20

  )

;; 2.2 exercise 21
;;
;; Use DrRacket’s stepper to evaluate (ff (ff 1)) step-by-step.

(test

  (ff (ff 1))
  =>
  (ff 10)

  (ff 10)
  =>
  100

  )

;; Also try (+ (ff 1) (ff 1)).

(test

  (+ (ff 1) (ff 1))
  =>
  (+ 10 (ff 1))

  (+ 10 (ff 1))
  =>
  (+ 10 10)

  (+ 10 10)
  =>
  20

  )

;; 2.2 exercise 22
;;
;; Use DrRacket's stepper on this program fragment

(define (distance-to-origin x y)
  (sqrt (+ (sqr x) (sqr y))))

(test

   (distance-to-origin 3 4)
   =>
   (sqrt (+ (sqr 3) (sqr 4)))

   (sqrt (+ (sqr 3) (sqr 4)))
   =>
   (sqrt (+ 9 (sqr 4)))

   (sqrt (+ 9 (sqr 4)))
   =>
   (sqrt (+ 9 16))

   (sqrt (+ 9 16))
   =>
   (sqrt 25)

   (sqrt 25)
   =>
   5

  )

;; 2.2 exercise 23
;;
;; The first 1String in "hello world" is "h".  How does the
;; following function compute this result?

(define (string-first s)
  (substring s 0 1))

(test

  (string-first "hello world")
  =>
  (substring "hello world" 0 1)

  (substring "hello world" 0 1)
  =>
  "h"

  )

;; 2.2 exercise 24
;;
;; Here is the definition of ==>:

(define (==> x y)
  (or (not x) y))

;; Use the stepper to determine the value of (==> #true #false).

(test

  (==> #true #false)
  =>
  (or (not #true) #false)

  (or (not #true) #false)
  =>
  (or #false #false)

  (or #false #false)
  =>
  #false

  )

;; 2.2 exercise 25
;;
;; Take a look at this attempt to solve exercise 17:

(require 2htdp/image)

(define (image-classify img)
  (cond
    [(>= (image-height img) (image-width img)) "tall"]
    [(= (image-height img) (image-width img)) "square"]
    [(<= (image-height img) (image-width img)) "wide"]))

;; Does stepping through an application suggest a fix?

(test

  ;; if an appropriate call is made, perhaps
  (image-classify (square 10 "solid" "green"))
  =>
  "tall"

  )

;; 2.2 exercise 26
;;
;; What do you expect as the value of this program:

(define (string-insert s i)
  (string-append (substring s 0 i)
                 "_"
                 (substring s i)))

(test

  ;; expected an error because the docs don't appear to
  ;; mention that the substring function can be called
  ;; with only two arguments.  however, it appears that
  ;; the third argument is not required.
  (string-insert "helloworld" 6)
  =>
  "hellow_orld"

  )

