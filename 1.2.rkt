#lang htdp/bsl

(require tests/eli-tester)

;; 1.2 the arithmetic of strings

;; 1.2 exercise 2
;;
;; Add the following two lines to the definitions area.

(define prefix "hello")

(define suffix "world")

;; Then use string primitives to create an expression that
;; concatenates prefix and suffix and adds "_" between them.

(test

  (string-append prefix "_" suffix)
  =>
  "hello_world"

  )
