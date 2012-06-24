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

(define (square x) (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))

(define current-test-comparator (make-parameter (lambda (expected actual) #t)))

(define (number-of-fermat-tests ) 5)

(define (search-for-prime start end)
  (define (next current) (+ current 2))
  (define (search-for-prime-rec end current-trial acc)
    (if (< current-trial end)
      (if (fast-prime? current-trial (number-of-fermat-tests))
        (search-for-prime-rec end (next current-trial) (cons current-trial acc))
        (search-for-prime-rec end (next current-trial) acc))
      (reverse acc)))
  (if (odd? start)
    (search-for-prime-rec end start '())
    (search-for-prime-rec end (+ start 1) '())))

(test-begin "1.24")

(test-group "1,000"
            (test '() (search-for-prime 2 1000)))

(test-group "10,000"
            (test '() (search-for-prime 2 10000)))

(test-group "100,000"
            (test '() (search-for-prime 2 100000)))

(test-group "1,000,000"
            (test '() (search-for-prime 2 100000)))

(test-end)
