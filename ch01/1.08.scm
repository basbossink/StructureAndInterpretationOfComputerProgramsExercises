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

(define (cube-root guess x)
  (define (cube x) (* x x x))
  (define (good-enough? guess x)
    (< (abs (/ (- (cube guess) x) x)) 1.e-5))
  (define (improve guess x)
    (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))
  (if (good-enough? guess x)
    guess
    (cube-root (improve guess x)
               x)))

(test-begin "1.08")

(test 3.0 (cube-root 1 27.0))
(test 2.0 (cube-root 1 8.0))
(test 4.0 (cube-root 1 64.0))
(test 123.0 (cube-root 1 1860867.0))
(test 1.e9 (cube-root 1 1.e27))
(test 1.e-90 (cube-root 1 1.e-270))

(test-end)
