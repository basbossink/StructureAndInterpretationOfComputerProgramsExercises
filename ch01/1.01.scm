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

(test-begin "1.1")

(test 10 10)
(test 12 (+ 5 3 4))
(test 8 (- 9 1))
(test 3 (/ 6 2))
(test 6 (+ (* 2 4) (- 4 6)))

(define a 3)
(define b (+ a 1))

(test 19 (+ a b (* a b)))
(test #f (= a b))
(test 3 (if (and (> a b) (< b (* a b)))
          b
          a))
(test 16 (cond ((= a 4) 6)
               ((= b 4) (+ 6 7 a))
               (else 25)))
(test 6 (+ 2 (if (> b a) b a)))
(test 16 (* (cond ((> a b) b a)
               ((< a b) b)
               (else -1))
            (+ a 1)))

(test-end)
