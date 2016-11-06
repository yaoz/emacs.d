(require 'php-mode)
(require 'php-extras)

(defvar php-extras-gen-eldoc-temp-methodname nil)

(setq php-extras-php-funcsummary-url
  "http://l/a.txt")
  ;; "http://svn.php.net/repository/phpdoc/doc-base/trunk/funcsummary.txt"



;;;###autoload
(defun php-extras-generate-eldoc ()
  "Regenerate PHP function argument hash table from php.net. This is slow!"
  (interactive)
  (when (yes-or-no-p "local? This is slow! ")
    (php-extras-generate-eldoc-1 t)))

(defun php-extras-generate-eldoc-1 (&optional byte-compile)
  (let ((function-arguments-temp (make-hash-table
                                  :size 5000
                                  :rehash-threshold 1.0
                                  :rehash-size 100
                                  :test 'equal)))
    (with-temp-buffer
      (url-insert-file-contents php-extras-php-funcsummary-url)
      (goto-char (point-min))
      (let ((line-count (count-lines (point-min) (point-max))))
        (with-syntax-table php-mode-syntax-table
          (while (not (eobp))
            (let ((current-line (buffer-substring (point-at-bol) (point-at-eol))))
              ;; Skip methods for now: is there anything more intelligent
              ;; we could do with them?
              (unless (string-match-p "::" current-line)
                (search-forward "(" (point-at-eol))
                (goto-char (match-beginning 0))
                (let ((function-name (thing-at-point 'symbol))
                      (help-string (replace-regexp-in-string "[[:space:]]+" " "
                                                             current-line))
                      (progress (* 100 (/ (float (line-number-at-pos)) line-count))))
                  (message "[%2d%%] Parsing %s..." progress function-name)
                  (puthash function-name help-string function-arguments-temp))))
            ;; Skip over function description
            (forward-line 2)))))
    (let* ((file (concat php-extras-eldoc-functions-file ".el"))
           (base-name (file-name-nondirectory php-extras-eldoc-functions-file)))
      (with-temp-file file
        (insert (format 
                 ";;; %s.el -- file auto generated by `php-extras-generate-eldoc'

 \(require 'php-extras)

 \(setq php-extras-function-arguments %S)

 \(provide 'php-extras-eldoc-functions)

;;; %s.el ends here
"
                 base-name
                 function-arguments-temp
                 base-name)))
      (when byte-compile
        (message "Byte compiling and loading %s ..." file)
        (byte-compile-file file t)
        (message "Byte compiling and loading %s ... done." file)))))


;;; php-extras-gen-eldoc.el ends here
