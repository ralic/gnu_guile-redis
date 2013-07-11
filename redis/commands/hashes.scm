;;; (redis commands hashes) --- redis module for Guile.

;; Copyright (C) 2013 Aleix Conchillo Flaque <aconchillo@gmail.com>
;;
;; This file is part of guile-redis.
;;
;; guile-redis is free software; you can redistribute it and/or
;; modify it under the terms of the GNU Lesser General Public
;; License as published by the Free Software Foundation; either
;; version 3 of the License, or (at your option) any later version.
;;
;; guile-redis is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; Lesser General Public License for more details.
;;
;; You should have received a copy of the GNU Lesser General Public
;; License along with guile-redis; if not, write to the Free Software
;; Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
;; 02110-1301 USA

;;; Commentary:

;; Redis module for Guile

;;; Code:

(define-module (redis commands hashes)
  #:use-module (redis utils)
  #:use-module (redis commands define)
  #:export (hdel hexists hget hgetall
            hincrby hincrbyfloat hkeys hlen
            hmget hmset hset hsetnx
            hvals))

(define* (hdel key field #:rest fields)
  (make-command "HDEL" read-integer key field fields))

(define (hexists key field)
  (make-command "HEXISTS" read-integer key field))

(define (hget key field)
  (make-command "HGET" read-bulk key field))

(define (hgetall key)
  (make-command "HGETALL" read-multi-bulk key))

(define (hincrby key field increment)
  (make-command "HINCRBY" read-integer key field (number->string increment)))

(define (hincrbyfloat key field increment)
  (make-command "HINCRBYFLOAT" read-integer key field (number->string increment)))

(define (hkeys key)
  (make-command "HKEYS" read-multi-bulk key))

(define (hlen key)
  (make-command "HLEN" read-integer key))

(define* (hmget key field #:rest fields)
  (make-command "HMGET" read-multi-bulk key field fields))

(define* (hmset key field value #:rest pairs)
  (make-command "HMSET" read-status key field value pairs))

(define (hset key field value)
  (make-command "HSET" read-integer key field value))

(define (hsetnx key field value)
  (make-command "HSETNX" read-integer key field value))

(define (hvals key)
  (make-command "HVALS" read-multi-bulk key))

;;; (redis commands hashes) ends here