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

(define (mult-iter x y)
  (define (halve d) (quotient d 2))
  (define (double d) (+ d d))
  (define (mult-iterr a x y)
    (cond ((or (= x 0) (= y 0)) 0)
          ((= x 1) (+ a y))
          ((even? x) (mult-iterr (+ a  (mult-iterr 0 (halve x) y)) (halve x) y))
          (else (mult-iterr (+ a y) (- x 1) y))))
    (mult-iterr 0 x y))

(define (assert-commutative expected x y)
  (test expected (mult-iter x y))
  (test expected (mult-iter y x)))

(test-begin "1.18")

(assert-commutative 0 0 1)
(assert-commutative 1 1 1)
(assert-commutative 7 7 1)
(assert-commutative 22 2 11)
(assert-commutative 33 3 11)
(assert-commutative 39 13 3)
(assert-commutative 100 20 5)
(assert-commutative 100 10 10)
(assert-commutative 42 7 6)

(test-end)

