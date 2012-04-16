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

(define (f n) 
  (if (< n 3) n
    (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))

(define (g n) 
  (define (g-iter a b c count)
    (if (= count 0) 
      c
      (g-iter (+ a (* 2 b) (* 3 c)) a b (- count 1))))
  (if (< n 3) n
    (g-iter 2 1 0 n))) 

(define n-expected-pairs (list 
  (cons 0 0)
  (cons 1 1)
  (cons 2 2)
  (cons 3 4)
  (cons 4 11)
  (cons 5 25)))

(define (test-func h)
  (map (lambda (pair) (test (cdr pair) (h (car pair))))  n-expected-pairs))

(test-begin "1.11")
(test-group "recursive implementation"
            (test-func f))
(test-group "iterative implementation"
            (test-func g))
(test-end)
