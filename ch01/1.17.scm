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

(define (mymult a b) 
  (define (halve x) (quotient x 2))
  (define (double x) (+ x x))
  (cond ((or (= a 0) (= b 0)) 0)
        ((= a 1) b)
        ((even? a) (mymult (halve a) (double b)))
        (else (+ (mymult (- a 1) b) b))))

(define (assert-mult expected lhs rhs)
  (test expected (mymult lhs rhs)))

(test-begin "1.17")

(assert-mult 0 0 1)
(assert-mult 9 9 1)
(assert-mult 100 10 10)
(assert-mult 10 2 5)
(assert-mult 10 5 2)
(assert-mult 42 3 14)
(assert-mult 99 3 33)
(assert-mult 12 3 4)

(test-end)
