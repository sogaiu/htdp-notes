#lang htdp/bsl

(require tests/eli-tester)

;; 2.3 composing functions

;; 2.3 unnamed
;;
;; Enter these definitions into DrRacket’s definitions area,
;; click RUN,

(define (letter first-name last-name signature-name)
  (string-append
   (opening first-name)
   "\n\n"
   (body first-name last-name)
   "\n\n"
   (closing signature-name)))

(define (opening first-name)
  (string-append "Dear " first-name ","))

(define (body first-name last-name)
  (string-append
   "We have discovered that all people with the" "\n"
   "last name " last-name " have won our lottery. So, " "\n"
   first-name ", " "hurry and pick up your prize."))

(define (closing signature-name)
  (string-append
   "Sincerely,"
   "\n\n"
   signature-name
   "\n"))

;; and evaluate these expressions in the interactions area:

(letter "Matthew" "Fisler" "Felleisen")

(letter "Kathi" "Felleisen" "Findler")

;; 2.3 aside

;; XXX: some of the following bits were from an aside --
;;      apparently, not meant to try immediately as the
;;      information about the require did not seem to appear
;;      until 2.5 programs...
(require 2htdp/batch-io)

(write-file 'stdout (letter "Matt" "Fiss" "Fell"))

;; 2.3 exercise 27
;;
;; Collect all definitions in DrRacket’s definitions area and
;; change them so that all magic numbers are refactored into
;; constant definitions.

#|

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (+ 180 (* 0.04 (attendees ticket-price))))

(define (attendees ticket-price)
  (- 120 (* (- ticket-price 5.0) (/ 15 0.1))))

|#

;; the next section. 2.4. has this text:
;;
;;   By convention, we use uppercase letters for global
;;   constants because it ensures that no matter how large
;;   the program is, the readers of our programs can easily
;;   distinguish such variables from others.
;;
;; so we'll go with that.

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

(define (attendees ticket-price)
  (- BASE-ATTENDANCE
     (* (- ticket-price BASE-TICKET-PRICE)
        (/ ATTENDANCE-DELTA TICKET-PRICE-DELTA))))

;; 2.3 exercise 28
;;
;; Determine the potential profit for these ticket prices:
;; $1, $2, $3, $4, and $5.  Which price maximizes the profit
;; of the movie theater?

(test

  (profit 1.00)
  =>
  511.2

  (profit 2.00)
  =>
  937.2

  ;; of the five prices, 3.00 yields the highest profit
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

;; Determine the best ticket price to a dime.

(test

  (profit 3.10)
  =>
  1059.3

  ;; looks like it may be this one, as:
  ;;
  ;;   2.80 -> 1062
  ;;   2.90 -> 1064.1
  ;;   3.00 -> 1063.2
  (profit 2.90)
  =>
  1064.1

  (profit 2.80)
  =>
  1062

  )

;; Enter this definition into DrRacket and ensure that it
;; produces the same results as the original version for
;; $1, $2, $3, $4, and $5.

;; XXX: changing the function name to avoid collisions

(define (profit-alt price)
  (- (* (+ 120
           (* (/ 15 0.1)
              (- 5.0 price)))
        price)
     (+ 180
        (* 0.04
           (+ 120
              (* (/ 15 0.1)
                 (- 5.0 price)))))))

(test

  (profit-alt 1.00)
  =>
  511.2

  (profit-alt 2.00)
  =>
  937.2

  (profit-alt 3.00)
  =>
  1063.2

  (profit-alt 4.00)
  =>
  889.2

  (profit-alt 5.00)
  =>
  415.2

  )

;; 2.3 exercise 29
;;
;; After studying the cost of a show, the owner discovered
;; several ways of lowering the cost.  As a result of these
;; improvements, there is no longer a fixed cost; a variable
;; cost of $1.50 per attendee remains.
;;
;; Modify both programs to reflect this change.  When the
;; programs are modified, test them again with ticket prices
;; of $3, $4, and $5 and compare the results.

;; XXX: another unfortunate case of having to change
;;      function names so that things can stay in this
;;      file.  in languages that allow shadowing of
;;      definitions, this wouldn't be needed i suspect.
;;
;; XXX: if definitions could live inside `(test ...)`
;;      forms and "shielded" from outside, that might
;;      have worked as well.  oh well.

(define (profit-29 ticket-price)
  (- (revenue-29 ticket-price)
     (cost-29 ticket-price)))

(define (revenue-29 ticket-price)
  (* ticket-price (attendees-29 ticket-price)))

(define PERFORMANCE-FIXED-COST-29 0)

(define PERFORMANCE-VARIABLE-COST-29 1.50)

(define (cost-29 ticket-price)
  (+ PERFORMANCE-FIXED-COST-29
     (* PERFORMANCE-VARIABLE-COST-29
        (attendees-29 ticket-price))))

(define BASE-ATTENDANCE-29 120)

(define BASE-TICKET-PRICE-29 5.0)

(define ATTENDANCE-DELTA-29 15)

(define TICKET-PRICE-DELTA-29 0.10)

(define (attendees-29 ticket-price)
  (- BASE-ATTENDANCE-29
     (* (- ticket-price BASE-TICKET-PRICE-29)
        (/ ATTENDANCE-DELTA-29 TICKET-PRICE-DELTA-29))))

(test

  (profit-29 3.00)
  =>
  630

  (profit-29 4.00)
  =>
  675

  (profit-29 5.00)
  =>
  420

  )

(define (profit-alt-29 price)
  (- (* (+ 120
           (* (/ 15 0.1)
              (- 5.0 price)))
        price)
     (+ 0
        (* 1.50
           (+ 120
              (* (/ 15 0.1)
                 (- 5.0 price)))))))

(test

  (profit-alt-29 3.00)
  =>
  630

  (profit-alt-29 4.00)
  =>
  675

  (profit-alt-29 5.00)
  =>
  420

  )

