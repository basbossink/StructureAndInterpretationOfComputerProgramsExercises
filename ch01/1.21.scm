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
(require "smallest-divisor")

(test-begin "1.21")

(test 199 (smallest-divisor 199))
(test 1999 (smallest-divisor 1999))
(test 199999 (smallest-divisor 199999))

(test-end)
