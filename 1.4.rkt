#lang htdp/bsl

(require tests/eli-tester)

;; 1.4 the arithmetic of images

;; 1.4 unnamed (1)
;;
;; Play with these operations

(require 2htdp/image)

(circle 10 "solid" "green")

(rectangle 10 20 "solid" "blue")

(star 12 "solid" "gray")

;; 1.4 unnamed (2)
;;
;; The above uses a previously unmentioned operation.
;; Look up its documentation and find out how many more
;; such operations the 2htdp/image teachpack comes with.
;; Experiment with the operations you find.
;;
;; XXX: this took way too long and there was no warning in
;;      the instructions as to how big a task it was.
;;      also, despite the amount of code below, i wouldn't
;;      say that the instructions were faithfully followed
;;      either as some functions were not tried.  success
;;      in summoning unpleasant feelings was achieved.  doubt
;;      about the entire endeavor surfaced.

#|

 2htdp/image defines (among other things):

 circle
 ellipse
 wedge
 line
 add-line
 add-curve
 add-solid-curve
 text
 text/font
 empty-image
 triangle
 right-triangle
 isosceles-triange
 triangle/sss
 triangle/ass
 triangle/sas
 triangle/ssa
 triangle/aas
 triangle/asa
 triangle/saa
 square
 rectangle
 rhombus
 star
 star-polygon
 radial-star
 regular-polygon
 pulled-regular-polygon
 polygon
 add-polygon
 scene+polygon

 |#

(ellipse 20 10 "solid" "yellow")

(wedge 10 120 "solid" "orange")

(line 30 20 "red")

(add-line (line 30 20 "red")
          30 20
          30 0 "goldenrod")

(add-curve (circle 15 "solid" "darkpink")
           ;; start angle pull
           15 15 0 2/3
           ;; end angle pull
           35 35 0 2/3
           "green")

(add-solid-curve (rectangle 100 100 "solid" "grey")
                 90 10 90 1
                 10 90 90 1
                 "purple")

(text "too many things to try" 30 "maroon")

(text/font "with some font info" 38 "yellow"
           #f 'roman 'italic 'bold #t)

(triangle 50 "solid" "blue")

(right-triangle 30 40 "solid" "red")

(isosceles-triangle 50 30 "solid" "green")

(triangle/saa 100 20 60 "solid" "grey")

;; XXX: all other triangle/___ functions skipped -- felt like
;;      too many

(square 30 "solid" "lightseagreen")

(rectangle 60 30 "solid" "yellow")

(rhombus 30 120 "solid" "orange")

(star 30 "solid" "purple")

(star-polygon 30 9 1 "solid" "skyblue")

(star-polygon 30 9 2 "solid" "red")

(radial-star 12 10 20 "solid" "yellow")

(regular-polygon 30 5 "solid" "green")

(pulled-regular-polygon 30 5 1.5 100 "solid" "blue")

(polygon (list (make-posn 0 0)
               (make-posn 0 50)
               (make-posn 25 75)
               (make-posn 50 0))
         "solid"
         "brown")

(add-polygon (square 100 "solid" "darkyellow")
             (list (make-posn (- 0 10) 0)
                   (make-posn (- 0 10) 50)
                   (make-posn (- 25 10) 75)
                   (make-posn (- 50 10) 0))
             "solid"
             "orange")

(scene+polygon (square 100 "solid" "pink")
               (list (make-posn (- 0 10) 0)
                     (make-posn (- 0 10) 50)
                     (make-posn (- 25 10) 75)
                     (make-posn (- 50 10) 0))
               "solid"
               "purple")

;; 1.4 unnamed (3)
;;
;; Explain how DrRacket determines the value of this expression:

(test

  (+ ;; width of the circle is twice the radius 2 * 10 = 20
     (image-width (circle 10 "solid" "red"))
     ;; height of the rectangle is: 20
     (image-height (rectangle 10 20 "solid" "blue")))
  =>
  (+ 20
     20)

  )

;; 1.4 unnamed (4)
;;
;; overlay/align is like overlay but accepts two strings that
;; shift the anchor point(s) to other parts of the rectangles.
;; There are nine different positions overall; experiment with
;; all possibilities!

;; XXX: this kind of exercise can start feeling tedious and
;;      demotivating

(overlay/align "left" "top"
               (square 10 "solid" "red")
               (square 30 "solid" "blue"))

(overlay/align "left" "middle"
               (square 10 "solid" "red")
               (square 30 "solid" "blue"))

(overlay/align "left" "bottom"
               (square 10 "solid" "red")
               (square 30 "solid" "blue"))

(overlay/align "middle" "top"
               (square 10 "solid" "red")
               (square 30 "solid" "blue"))

(overlay/align "middle" "middle"
               (square 10 "solid" "red")
               (square 30 "solid" "blue"))

(overlay/align "middle" "bottom"
               (square 10 "solid" "red")
               (square 30 "solid" "blue"))

(overlay/align "right" "top"
               (square 10 "solid" "red")
               (square 30 "solid" "blue"))

(overlay/align "right" "middle"
               (square 10 "solid" "red")
               (square 30 "solid" "blue"))

(overlay/align "right" "bottom"
               (square 10 "solid" "red")
               (square 30 "solid" "blue"))

;; 1.4 unnamed (5)

(scene+line (rectangle 80 90 "solid" "grey")
            -10 -10 100 100 "red")

;; 1.4 exercise 5
;;
;; Use the 2htdp/image teachpack to create the image of a simple
;; boat or tree. Make sure you can easily change the scale of
;; the entire image.

(define factor 3)

(define h-parm 30)

(define w-parm 10)

(define green-part
  (beside (flip-horizontal (right-triangle w-parm h-parm "solid" "green"))
          (right-triangle w-parm h-parm "solid" "green")))

(define brown-part
  (rectangle w-parm (/ h-parm 2) "solid" "brown"))

(define tree
  (scale factor (above green-part brown-part)))

tree

;; 1.4 exercise 6
;;
;; Add the following line to the definitions area

;; XXX: did not figure out how to follow the instructions
;;      precisely without making the file format non-text,
;;      so doing the following instead

(define cat (rectangle 75 117 "solid" "grey"))

;; Create an expression that counts the number of pixels in the
;; image.

(test

  (* (image-width cat)
     (image-height cat))
  =>
  8775

  )
