;; http://www.emacswiki.org/emacs-es/RecentFiles
;; http://docs.huihoo.com/homepage/shredderyin/emacs_elisp.html
(require 'recentf)
(recentf-mode 1)

(defun recentf-open-files-compl ()
  "不好用"
  (interactive)
  (let* ((all-files recentf-list)
	 (tocpl (mapcar (function 
			 (lambda (x) (cons (file-name-nondirectory x) x))) all-files))
	 (prompt (append '("File name: ") tocpl))
	 (fname (completing-read (car prompt) (cdr prompt) nil nil)))
    (find-file (cdr (assoc-ignore-representation fname tocpl))))) 



(defun recentf-ido-find-file ()
  "Find a recent file using Ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))

;; (defun recentf-ido-find-file ()
;;   "Find a recent file using Ido.无目录前缀,但同名,服务器"
;;   (interactive)
;;   (let* ((file-assoc-list
;; 	  (mapcar (lambda (x)
;; 		    (cons (file-name-nondirectory x)
;; 			  x))
;; 		  recentf-list))
;; 	 (filename-list
;; 	  (remove-duplicates (mapcar #'car file-assoc-list)
;; 			     :test #'string=))
;; 	 (filename (ido-completing-read "Choose recent file: "
;; 					filename-list
;; 					nil
;; 					t)))
;;     (when filename
;;       (find-file (cdr (assoc filename
;; 			     file-assoc-list))))))

(global-set-key "\C-x\ \C-r" 'recentf-ido-find-file)


(provide 'recentf-config)
