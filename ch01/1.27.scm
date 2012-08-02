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

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (fermat-test-rec a n)
  (cond ((= a n) #t)
        (else 
          (and (= a (expmod a n n)) (fermat-test-rec (+ 1 a) n)))))
    (fermat-test-rec 1 n))

(test-begin "1.27")

(test #t (fermat-test 561))
(test #t (fermat-test 1105))
(test #t (fermat-test 1729))
(test #t (fermat-test 2465))
(test #t (fermat-test 2821))
(test #t (fermat-test 6601))

(test-end)
