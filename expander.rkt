#lang racket

(require syntax/parse/define)

(require quickgen/prelude)
(provide (all-from-out quickgen/prelude))
(require quickgen/arrays)
(provide (all-from-out quickgen/arrays))


(define output-file (make-parameter #f))
(define print-to-screen (make-parameter #f))

(define command-args
  (command-line
   #:program "quickgen"
   #:once-each
   [("-o" "--output") file "Output file"
                (output-file file)]
   [("-p" "--print") "Print to screen"
                     (print-to-screen #t)]
   ))

(provide (rename-out [-module-begin #%module-begin])
         (except-out (all-from-out racket) #%module-begin))

(define-syntax-parse-rule (-module-begin body ...)
  (#%module-begin
    body ...
    ; Print the output to the screen
    (when (print-to-screen)
      (display (get-output-string output)))
    ; If there is an output file, write the output to the file
    (when (not (false? (output-file)))
        (begin
          (define output-port (open-output-file (output-file) #:exists 'replace))
          (display (get-output-string output) output-port)
          (close-output-port output-port)))
    ))
