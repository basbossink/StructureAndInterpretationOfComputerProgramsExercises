;; Copyright 2012 Bas Bossink 
;; <bas.bossink@gmail.com>
;; http://basbossink.github.com/

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

(require-extension test)
(require "fast-smallest-divisor")

(define current-test-comparator (make-parameter (lambda (expected actual) #t)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (report-prime-untimed prime)
  (newline)
  (display "found prime: ")
  (display prime))

(define (search-for-prime start end)
  (define (next current) (+ current 2))
  (define (search-for-prime-rec end current-trial acc)
    (if (< current-trial end)
      (if (prime? current-trial)
        (search-for-prime-rec end (next current-trial) (cons current-trial acc))
        (search-for-prime-rec end (next current-trial) acc))
      (reverse acc)))
  (if (odd? start)
    (search-for-prime-rec end start '())
    (search-for-prime-rec end (+ start 1) '())))

(test-begin "1.23")

(test-group "1,000"
            (test '() (search-for-prime 2 1000)))

(test-group "10,000"
            (test '() (search-for-prime 2 10000)))

(test-group "100,000"
            (test '() (search-for-prime 2 100000)))

(test-group "1,000,000"
            (test '() (search-for-prime 2 100000)))

(test-end)
