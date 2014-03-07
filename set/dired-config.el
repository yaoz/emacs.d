;显示 size kb mb
(setq dired-listing-switches "-alh")
(setq delete-by-moving-to-trash t
      trash-directory "/home/.trash"
      dired-recursive-deletes 'always)

(setq dired-dwim-target t)
;; (put 'dired-find-alternate-file 'disabled nil)

(setq image-dired-thumb-height 400)
(setq image-dired-thumb-width 400)

(defun dired-do-cat-file ()
  "run 'cat' on the marked or current file; useful when visiting file is slow over tramp"
  (interactive)
  (when (not (string-match "\.root" (dired-get-filename t)))
	(shell-command (concat "cat " (dired-get-filename t)))))


(defun dired-do-head-file ()
  "run 'tail' on the marked or current file; useful when visiting file is slow over tramp"
  (interactive)
  (when (not (string-match "\.root" (dired-get-filename t)))
	(shell-command (concat "head -n 35 " (dired-get-filename t)))))


(defun dired-do-tail-file ()
  "run 'tail' on the marked or current file; useful when visiting file is slow over tramp"
  (interactive)
  (when (not (string-match "\.root" (dired-get-filename t)))
	(shell-command (concat "tail -n 35 " (dired-get-filename t)))))

(defun dired-do-open-files ()
  "Open marked or current file in dired buffer with proper file
  association using the 'open' program"
  (interactive)
  (let (files)
    (if (= (length (dired-get-marked-files)) 0)
        (setq files (dired-get-filename))
	  (setq files (mapconcat (function (lambda (x) (concat "\"" x "\"")))
							 (dired-get-marked-files) " ")))
    (shell-command (concat "open-cyg " files))))

(defun dired-find-multiple-file (&optional arg)
  "Open each of the marked files, or the file under the point, or when prefix arg, the next N files "
  (interactive "P")
  (let* ((fn-list (dired-get-marked-files nil arg)))
	(mapc 'find-file fn-list)))

(defun dired-do-insert-subdir-maybe ()
  "Insert current or marked lines in dired buffer just as dired-maybe-insert-subdir "
  (interactive)
  (if (= (length (dired-get-marked-files)) 0)
	  (dired-maybe-insert-subdir (dired-get-filename))
	(dired-map-over-marks-check (lambda()
				  (dired-maybe-insert-subdir (dired-get-filename)  nil t) ) nil 'display t)
	))

(defun dired-do-get-size ()
  "Use du to find out the total size of all marked files"
  (interactive)
  (let ((files (dired-get-marked-files)))
    (message "Getting size of marked file(s)...")
    (with-temp-buffer
      (apply 'call-process "du" nil t nil "-sch" files)
      (message "Size of marked files: %s"
               (progn
                 (re-search-backward "\\(^[0-9.]+[A-Za-z]*\\).*total$")
				 (match-string 1))))))

(defun dired-copy-filename-as-kill-newline (&optional arg)
  "same as dired-copy-filename-as-kill but use newline instead of space as separator"
  (interactive "P")
  (let ((string
         (or (dired-get-subdir)
             (mapconcat (function identity)
                        (if arg
                            (cond ((zerop (prefix-numeric-value arg))
                                   (dired-get-marked-files))
                                  ((consp arg)
                                   (dired-get-marked-files t))
                                  (t
                                   (dired-get-marked-files
									'no-dir (prefix-numeric-value arg))))
                          (dired-get-marked-files 'no-dir))
                        "\n"))))
    (if (eq last-command 'kill-region)
		(kill-append string nil)
      (kill-new string))
	(message "Filenames copied to kill ring.")))


(defun my-dired-mode-hook()
  (setq truncate-lines t)
  
  (defvar dired-sort-map (make-sparse-keymap))
  (define-key dired-mode-map "s" dired-sort-map)
  (define-key dired-sort-map "s" '(lambda () "sort by Size"
		(interactive) (dired-sort-other (concat dired-listing-switches "S"))))
  (define-key dired-sort-map "x" '(lambda () "sort by eXtension"
		 (interactive) (dired-sort-other (concat dired-listing-switches "X"))))
  (define-key dired-sort-map "t" '(lambda () "sort by Time"
		 (interactive) (dired-sort-other (concat dired-listing-switches "t"))))
  (define-key dired-sort-map "n" '(lambda () "sort by Name"
		 (interactive) (dired-sort-other (concat dired-listing-switches ""))))
)

(add-hook 'dired-mode-hook 'my-dired-mode-hook)

(provide 'dired-config)
