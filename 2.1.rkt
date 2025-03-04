#lang htdp/bsl

(require tests/eli-tester)

;; 2.1 functions

(define (f x) 1)

(define (g x y) (+ 1 1))

(define (h x y z) (+ (* 2 2) 3))

;; 2.1
;;
;; The following three experiments, for example, confirm
;; that f from above produces the same value no matter what
;; input it is applied to:

(test

  (f 1)
  =>
  1

  (f "hello world")
  =>
  1

  (f #true)
  =>
  1

  )

;; 2.1
;;
;; What does (f (circle 3 "solid" "red")) yield?

(require 2htdp/image)

(test
  
  (f (circle 3 "solid" "red"))
  =>
  1
  
  )

;; 2.1 exercise 11
;;
;; Define a function that consumes two numbers, x and y, and
;; that computes the distance of point (x,y) to the origin.

(define (distance x y)
  (sqrt (+ (sqr x) (sqr y))))

(test

  (distance 3 4)
  =>
  5

  (distance 5 12)
  =>
  13
 
  )

;; 2.1 exercise 12
;;
;; Define the function cvolume, which accepts the length of
;; a side of an equilateral cube and computes its volume.  If
;; you have time, consider defining csurface, too.

(define (cvolume side)
  (* side side side))

(define (csurface side)
  (* 6 (* side side)))

(test

  (cvolume 1)
  =>
  1

  (cvolume 2)
  =>
  8

  (csurface 1)
  =>
  6

  (csurface 2)
  =>
  24
 
  )

;; 2.1 exercise 13
;;
;; Define the function string-first, which extracts the first
;; 1String from a non-empty string.

(define (string-first s)
  (string-ith s 0))

(test

  (string-first "hello")
  =>
  "h"
 
  )

;; 2.1 exercise 14
;;
;; Define the function string-last, which extracts the last
;; 1String from a non-empty string.

(define (string-last s)
  (string-ith s (sub1 (string-length s))))

(test

  (string-last "apple")
  =>
  "e"
 
  )

;; 2.1 exercise 15
;;
;; Define ==>. The function consumes two Boolean values, call
;; them sunny and friday.  Its answer is #true if sunny is false
;; or friday is true.  Note Logicians call this Boolean
;; operation implication, and they use the notation sunny =>
;; friday for this purpose.

(define (==> sunny friday)
  ;; XXX: could just use the or form?
  (if (or (not sunny) friday)
      #true
      #false))

(test

  (==> #true #true)
  =>
  #true

  (==> #true #false)
  =>
  #false

  (==> #false #true)
  =>
  #true

  (==> #false #false)
  =>
  #true
  
  )

;; 2.1 exercise 16
;;
;; Define the function image-area, which counts the number
;; of pixels in a given image.

(define (image-area image)
  (* (image-width image) (image-height image)))

(test

  (image-area (square 10 "solid" "green"))
  =>
  100
 
  )

;; 2.1 exercise 17
;;
;; Define the function image-classify, which consumes an
;; image and conditionally produces "tail" if the image is
;; taller than wide, "wide" if it is wider than tall, or
;; "square" if its width and height are the same.

(define (image-classify image)
  (if (> (image-height image)
         (image-width image))
      "tall"
      (if (< (image-height image)
             (image-width image))
          "wide"
          "square")))

(test

  (image-classify (square 20 "solid" "blue"))
  =>
  "square"

  (image-classify (rectangle 10 20 "solid" "red"))
  =>
  "tall"

  (image-classify (rectangle 20 10 "solid" "green"))
  =>
  "wide"
 
  )

;; 2.1 exercise 18
;;
;; Define the function string-join, which consumes two
;; strings and appends them with "_" in between.

(define (string-join left right)
  (string-append left "_" right))

(test

  (string-join "hello" "world")
  =>
  "hello_world"
 
  )

;; 2.1 exercise 19
;;
;; Define the function string-insert, which consumes a string
;; str plus a number i and inserts "_" at the ith position of
;; str.  Assume i is a number between 0 and the length of the
;; given string (inclusive).

(define (string-insert str i)
  (string-append (substring str 0 i)
                 "_"
                 (substring str i (string-length str))))

(test

  (string-insert "hello" 0)
  =>
  "_hello"

  (string-insert "hello" 3)
  =>
  "hel_lo"
  
  (string-insert "" 0)
  =>
  "_"
  
  )

;; 2.1 exercise 20
;;
;; Define the function string-delete, which consumes a string
;; plus a number i and deletes the ith position from str.
;; Assume i is a number between 0 (inclusive) and the length
;; of the given string (exclusive).

(define (string-delete str i)
  (string-append (substring str 0 i)
                 (substring str (add1 i) (string-length str))))

(test

  (string-delete "helllo" 3)
  =>
  "hello"

  ;; string-delete cannot deal with empty strings
  (string-delete "" 0)
  =>
  (error "substring: starting index is out of range\n"
         "  starting index: 1\n"
         "  valid range: [0, 0]\n"
         "  string: \"\"")
  
  )
