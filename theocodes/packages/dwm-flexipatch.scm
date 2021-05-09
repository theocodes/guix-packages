(define-module (gnu packages dwm-flexipatch)
  #:use-module (guix licenses)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system gnu)
  #:use-module (gnu packages)
  #:use-module (gnu packages xorg))

;; (define-public dwm-flexipatch
  (package
    (name "dwm-flexipatch")
    (version "6.0")
    (source (origin
             (method url-fetch)
             (uri (string-append "http://dl.suckless.org/dwm/dwm-"
                                 version ".tar.gz"))
             (sha256
              (base32 "0mpbivy9j80l1jqq4bd4g4z8s5c54fxrjj44avmfwncjwqylifdj"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f
       #:phases
       (alist-replace
        'configure
        (lambda _
         (substitute* "Makefile" (("\\$\\{CC\\}") "gcc"))
         #t)
        (alist-replace
         'install
         (lambda* (#:key outputs #:allow-other-keys)
          (let ((out (assoc-ref outputs "out")))
           (zero?
            (system* "make" "install"
                     (string-append "DESTDIR=" out) "PREFIX="))))
         %standard-phases))))
    (inputs
     `(("libx11" ,libx11)
       ("libxinerama" ,libxinerama)))
    (home-page "https://github.com/theocodes/dwm-flexipatch.git")
    (synopsis "Dynamic window manager")
    (description
     "My personal build of dwm-flexipatch with only the patches I use applied.")
    (license x11))
;; )

;; (use-modules (guix packages)
;;              (guix download)
;;              (guix build-system gnu)
;;              (guix licenses))

;; (package
;;   (name "my-hello")
;;   (version "2.10")
;;   (source (origin
;;             (method url-fetch)
;;             (uri (string-append "mirror://gnu/hello/hello-" version
;;                                 ".tar.gz"))
;;             (sha256
;;              (base32
;;               "0ssi1wpaf7plaswqqjwigppsg5fyh99vdlb9kzl7c9lng89ndq1i"))))
;;   (build-system gnu-build-system)
;;   (synopsis "Hello, Guix world: An example custom Guix package")
;;   (description "")
;;   (home-page "https://www.gnu.org/software/hello/")
;;   (license gpl3+))
