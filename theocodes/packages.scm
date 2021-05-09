(define-module (theocodes packages)
  #:use-module ((gnu packages) #:prefix gnu:)
  #:use-module (guix diagnostics)
  #:use-module (guix i18n)
  #:use-module (srfi srfi-1)
  #:export ())

(define %channel-root
  (find (lambda (path)
          (file-exists? (string-append path "/theocodes/packages.scm")))
        %load-path))
