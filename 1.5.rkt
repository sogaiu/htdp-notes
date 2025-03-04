#lang htdp/bsl

(require tests/eli-tester)

;; 1.5 the arithmetic of booleans

;; 1.5 exercise 7
;;
;; Suppose you want to decide whether today is an appropriate
;; day to go to the mall.  You go to the mall either if it is
;; not sunny or if today is Friday (because this is when stores
;; post new sales items).

;; First add these two lines to the definitions area of DrRacket:

(define sunny #true)

(define friday #false)

;; Now create an expression that computes whether sunny is false
;; or friday is true.

(test

  (or ;; #false
      (not sunny)
      ;; #false
      friday)
  =>
  #false

  )

;; 1.5 unnamed
;;
;; How many combinations of Booleans can you associate with sunny
;; and friday?

(test

  (or (not #true) #true)
  =>
  #true

  (or (not #true) #false)
  =>
  #false

  (or (not #false) #true)
  =>
  #true

  (or (not #false) #false)
  =>
  #true

  )

