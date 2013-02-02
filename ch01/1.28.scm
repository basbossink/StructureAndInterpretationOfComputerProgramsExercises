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

(define (non-trivial-root x remainder-square m) 
  (if (and (= 1 remainder-square)
       (not (= 1 x))
       (not (= (- m 1) x)))
         0
         remainder-square))

(define (non-trivial-root-or-remainder x m)
  (non-trivial-root x m (remainder (square x) m)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (non-trivial-root-or-remainder (expmod base (/ exp 2) m) m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))
(define (miller-rabin-test n)
  (define (miller-rabin-test-iter c n)
    (cond ((= 1 (expmod (random (- n 1)))))))

(test-begin "1.28")

(test #t (miller-rabin-test 5))
(test #f (miller-rabin-test 15))
(test #t (miller-rabin-test 97))
(test #f (miller-rabin-test 121))
(test #f (miller-rabin-test 1003))
(test #t (miller-rabin-test 1009))
(test #t (miller-rabin-test 100003))
(test #t (miller-rabin-test 100005))
(test #f (miller-rabin-test 561))
(test #f (miller-rabin-test 1105))
(test #f (miller-rabin-test 1729))
(test #f (miller-rabin-test 2465))
(test #f (miller-rabin-test 2821))
(test #f (miller-rabin-test 6601))

(test-end)
