#lang htdp/bsl

(require tests/eli-tester)

;; 2.4 global constants

;; 2.4 exercise 30
;;
;; Define constants for the price optimization program at
;; the movie theater so that the price sensitivity of
;; attendance (15 people for every 10 cents) becomes a
;; computed constant.

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define PERFORMANCE-FIXED-COST 180)

(define PERFORMANCE-VARIABLE-COST 0.04)

(define (cost ticket-price)
  (+ PERFORMANCE-FIXED-COST
     (* PERFORMANCE-VARIABLE-COST
        (attendees ticket-price))))

(define BASE-ATTENDANCE 120)

(define BASE-TICKET-PRICE 5.0)

(define ATTENDANCE-DELTA 15)

(define TICKET-PRICE-DELTA 0.10)

(define ATTENDANCE-PRICE-SENSITIVITY
  (/ ATTENDANCE-DELTA TICKET-PRICE-DELTA))

(define (attendees ticket-price)
  (- BASE-ATTENDANCE
     (* (- ticket-price BASE-TICKET-PRICE)
        ATTENDANCE-PRICE-SENSITIVITY)))

(test

  (profit 1.00)
  =>
  511.2

  (profit 2.00)
  =>
  937.2

  (profit 3.00)
  =>
  1063.2

  (profit 4.00)
  =>
  889.2

  (profit 5.00)
  =>
  415.2

  )
