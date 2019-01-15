#lang racket

(define (stream-from x) (cons x (lambda () (stream-from (+ x 1)))))

(define (sequence spacing low high)
  (if (> low high)
      null
      (append  (list low) (sequence spacing (+ low spacing) high))))

(define (string-append-map xs str)
  (map (lambda (x) (string-append x str)) xs))

(define (stream-for-k-steps s k)
  (if (= k 0) null
      (append (list (car s)) (stream-for-k-steps ((cdr s)) (- k 1)))))

(define (funny-number-stream x) (cons (if (= (remainder x 6) 0) (* -1 x) x) (lambda () (funny-number-stream (+ x 1)))))