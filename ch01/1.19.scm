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

(define (naive-fib n)
    (cond ((< n 2) n)
          (else (+ (naive-fib (- n 1)) (naive-fib (- n 2))))))

(test-begin "1.19")

(test 0 (naive-fib 0))
(test 1 (naive-fib 1))
(test 1 (naive-fib 2))
(test 2 (naive-fib 3))
(test 3 (naive-fib 4))
(test 5 (naive-fib 5))
(test 8 (naive-fib 6))
(test 13 (naive-fib 7))
(test 21 (naive-fib 8))
(test 34 (naive-fib 9))
(test 55 (naive-fib 10))
(test 89 (naive-fib 11))
(test 144 (naive-fib 12))

(test-end)
