#lang htdp/bsl

(require tests/eli-tester)

;; 1.3 mixing it up

;; 1.3 unnamed exercises
;;
;; Also use inappropriate arguments for some operations just
;; to find out how BSL reacts.

(test

  (string-length 42)
  =>
  (error (string-append "string-length: contract violation\n"
                        "  expected: string?\n"
                        "  given: 42"))

  )

;; Before you go on, construct some nested expressions that
;; mix data in the wrong way.

(test

  ;; error output is similar to the previous case, but if evaluated
  ;; in the interactions area, the highlighted expression is just
  ;; the relevant sub-expression
  (+ (string-length 42) 1)
  =>
  (error (string-append "string-length: contract violation\n"
                        "  expected: string?\n"
                        "  given: 42"))

  )

;; 1.3 exercise 3
;;
;; Add the following two lines to the definitions area.

(define str "helloworld")

(define i 5)

;; Then create an expression using string primitives that adds "_"
;; at position i.

(test

  (string-append (substring str 0 i)
                 "_"
                 (substring str i))
  =>
  "hello_world"

  )

;; 1.3 exercise 4
;;
;; Use the same setup as in exercise 3 to create an expression
;; that deletes the ith position from str. Clearly this expression
;; creates a shorter string than the given one.

(test

  (string-append (substring str 0 i)
                 (substring str (add1 i)))
  =>
  "helloorld"

  )

;; Which values for i are legitimate?

(test

  ;; i can be as low as 0
  (string-append (substring str 0 0)
                 (substring str (add1 0)))
  =>
  "elloworld"

  ;; i can be as high as the length of str
  (string-append (substring str 0 (sub1 (string-length str)))
                 (substring str (add1 (sub1 (string-length str)))))
  =>
  "helloworl"

  )
