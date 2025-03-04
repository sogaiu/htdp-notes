#lang htdp/bsl

(require tests/eli-tester)

;; 1.6 mixing it up with booleans

;; 1.6 unnamed (1)

(define x 2)

;; Right-click on the result and choose a different representation.

(if (= x 0) 0 (/ 1 x))

;; right-clicking on answer in interaction area shows a popup
;; menu with:
;;
;; * View decimal expansion
;; * View as mixed fraction
;; * View as improper fraction

;; 1.6 unnamed (2)
;;
;; Imagine you edit the definition so that it looks like this:
;;
;;   (define x 0)
;;
;; What do you think
;;
;;   (if (= x 0) 0 (/ 1 x))
;;
;; evaluates to in this context?

;; XXX: using y instead of x to work-around dissonance between
;;      racket, htdp, and my desire to keep each part in a single
;;      file :)

(define y 0)

(test

  (if (= y 0) 0 (/ 1 y))
  =>
  (if #true 0 (/ 1 y))

  ;; XXX: might have been nicer if the expression didn't need to
  ;;      be repeated, say by being able to interleave => between
  ;;      expressions, but perhaps that is too much to ask for
  (if #true 0 (/ 1 y))
  =>
  0

  )

;; 1.6 unnamed (3)
;;
;; Explain what the following four comparison primitives determine
;; about numbers: <, <=, >, >=.

(test

  (< 0 1)
  =>
  #true

  (<= 0 0)
  =>
  #true

  (> 1 0)
  =>
  #true

  (>= 1 1)
  =>
  #true

  )

;; 1.6 unnamed (4)
;;
;; Look up their documentation. Or, experiment, guess a general
;; law, and then check in the documentation whether you guessed
;; right.

(test

  (string<=? "a" "b")
  =>
  #true

  (string<=? "a" "aa")
  =>
  #true

  )

;; 1.6 exercise 8

;; Create a conditional expression that computes whether the
;; image is tall or wide. An image should be labeled "tall"
;; if its height is larger than or equal to its width;
;; otherwise it is "wide".

;; XXX: did not figure out how to follow the instructions
;;      precisely without making the file format non-text,
;;      so doing the following instead

(require 2htdp/image)

(define cat (rectangle 75 117 "solid" "grey"))

(test

  (if (>= (image-height cat)
          (image-width cat))
      "tall"
      "wide")
  =>
  "tall"

  )

;; Now try the following modification. Create an expression
;; that computes whether a picture is "tall", "wide", or
;; "square".

(define tall-image (rectangle 10 100 "solid" "green"))

(define wide-image (rectangle 100 10 "solid" "green"))

(define square-image (square 10 "solid" "green"))

(test

  (if (> (image-height tall-image)
         (image-width tall-image))
      "tall"
      (if (< (image-height tall-image)
             (image-width tall-image))
          "wide"
          "square"))
  =>
  "tall"

  (if (> (image-height wide-image)
         (image-width wide-image))
      "tall"
      (if (< (image-height wide-image)
             (image-width wide-image))
          "wide"
          "square"))
  =>
  "wide"

  (if (> (image-height square-image)
         (image-width square-image))
      "tall"
      (if (< (image-height square-image)
             (image-width square-image))
          "wide"
          "square"))
  =>
  "square"

  )

