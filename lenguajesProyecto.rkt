#lang racket
(require web-server/servlet
     web-server/servlet-env)

(define root (current-directory))

(define index-page (file->string "racketWeb/index.html"))

(define (hello-servlet req)
  (response
   200                 ; response code
   #"OK"               ; response message
   (current-seconds)   ; timestamp
   TEXT/HTML-MIME-TYPE ; MIME type for content
   '()                 ; additional headers

   (lambda (client-out)
     (write-string index-page client-out))))

; start serving:
(serve/servlet hello-servlet
               #:servlet-path "/racketWeb/index.html"
               #:extra-files-paths (list (build-path root)))