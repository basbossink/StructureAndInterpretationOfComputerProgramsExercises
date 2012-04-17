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

(define (combination n k)
  (cond ((= n k) 1)
        ((= n 0) 1)
        ((= k 0) 1)
        (else (+ (combination (- n 1) (- k 1)) (combination (- n 1) k)))))

(test-begin "1.12")

(define (assert-combination expected n k)
  (test expected (combination n k)))

(assert-combination 1 0 0)
(assert-combination 1 1 0)
(assert-combination 1 1 1)
(assert-combination 1 2 0)
(assert-combination 2 2 1)
(assert-combination 1 2 2)
(assert-combination 1 3 0)
(assert-combination 3 3 1)
(assert-combination 3 3 2)
(assert-combination 1 3 3)
(assert-combination 1 4 0)
(assert-combination 4 4 1)
(assert-combination 6 4 2)
(assert-combination 4 4 3)
(assert-combination 1 4 4)

(test-end)
