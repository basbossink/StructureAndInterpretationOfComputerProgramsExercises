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

(define (fast-expt x y)
  (define (even? n) (= 0 (remainder n 2)))
  (define (fast-expt-iter a b n)  
    (cond ((= n 0) a)
          ((= n 1) (* a b))
          ((even? n) (fast-expt-iter (* a (fast-expt-iter 1 b (quotient n 2))) b (quotient n 2)))
          (else (fast-expt-iter (* a b) b (- n 1)))))
  (fast-expt-iter 1 x y))

(test-begin "1.16")

(test 1 (fast-expt 2 0))
(test 2 (fast-expt 2 1))
(test 8 (fast-expt 2 3))
(test 9 (fast-expt 3 2))
(test 125 (fast-expt 5 3))
(test 81 (fast-expt 3 4))
(test 1 (fast-expt 1 37))



(test-end)
