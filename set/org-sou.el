;;; org-sou.el - Support for links to manpages in Org

(require 'org)

(org-add-link-type "sou" 'org-sou-open)
(add-hook 'org-store-link-functions 'org-sou-store-link)

(defcustom org-sou-command 'sou
  "cccc"
  :group 'org-link
  :type '(choice (const sou)))

(defun org-sou-open (path)
  (let ((now-buffer (buffer-name))
	(word (replace-regexp-in-string ".*::" "" path))
	(p (replace-regexp-in-string "::.*" "" path))
	;; (bf (replace-regexp-in-string ".*/" "" p))
	)
    (let ( (bf (replace-regexp-in-string ".*/" "" p)) )
      (if (buffer-exists bf)
	  (progn
	    (switch-to-buffer bf)
	    (goto-char 0)
	    (if (search-forward word nil t)
		nil
	      (progn 
		(switch-to-buffer now-buffer)
		(message (concat bf ":没有找到:" word))
		)))
	(progn
	  (find-file p)
	  (goto-char 0)
	  (if (search-forward word nil t)
	      nil
	    (progn 
	      (switch-to-buffer now-buffer)
	      (message (concat bf ":没有找到:" word))
	      )))
	))))

(defun org-sou-store-link ()
  (when (memq major-mode '(Sou-mode))
    (let* ((page (org-sou-get-page-name))
	   (link (concat "sou:" page))
	   (description (format "Soupage for %s" page)))
      (org-store-link-props
       :type "sou"
       :link link
       :description description))))

(defun org-sou-get-page-name ()
  (if (string-match " \\(\\S-+\\)\\*" (buffer-name))
      (match-string 1 (buffer-name))
    (error "Cannot create link to this sou page")))







;; bmk书签
(org-add-link-type "bmk" 'org-bmk-open)
(add-hook 'org-store-link-functions 'org-bmk-store-link)

(defcustom org-bmk-command 'bmk
  "cccc"
  :group 'org-link
  :type '(choice (const bmk)))

(defun org-bmk-open (path)
  (let ((now-buffer (buffer-name)))
    (bookmark-jump path)))

(defun org-bmk-store-link ()
  (when (memq major-mode '(Bmk-mode))
    (let* ((page "ccccc")
	   (link (concat "bmk:" page))
	   (description (format "Bmkpage for %s" page)))
      (org-store-link-props
       :type "bmk"
       :link link
       :description description))))

(provide 'org-sou)
