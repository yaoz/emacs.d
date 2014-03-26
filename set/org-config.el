(require 'org-sou)
(add-hook 'org-mode-hook
          '(lambda ()
             (define-key org-mode-map [(control tab)] nil)))

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock)
(setq org-agenda-files (list "/doc/todo.org"))
(define-key global-map "\C-ca" 'org-agenda)
(setq org-default-notes-file "/doc/tip.org")
(define-key global-map "\C-cc" 'org-capture)
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "/doc/todo.org" "Tasks")
             "* TODO %?\n  %i\n  %a")
        ("l" "Lisp" entry (file+headline "/doc/lisp.org" "Lisp 笔记")
             "* %?\n  %i\n  %a")
        ("p" "PHP" entry (file+headline "/doc/php.org" "php 笔记")
             "* %?\n  %i\n  %a")
        ("b" "笔记" entry (file+headline "/doc/tip.org" "笔记")
             "* %?\n  %i\n  %a")
		))

;; org 换行
(setq org-startup-truncated nil)
;; (defun nolinum ()
;;   (global-linum-mode 0)
;; )
;; (add-hook 'org-mode-hook 'nolinum)
(add-hook 'org-mode-hook 'turn-off-auto-fill)

(require 'ox-html)
(setq org-publish-project-alist
      '(
        ("fo" 
         :base-directory "/fo/doc/"
         :base-extension "org"
         :publishing-directory "/fo/html/"
         ;; :publishing-function org-publish-org-to-html ;;老的无用
         :publishing-function org-html-publish-to-html
         :headline-levels 10
         :auto-preamble t
         )
        ("fo-xyb"
         :base-directory "/fo/xyb/"
         :base-extension "org"
         :publishing-directory "/fo/html/"
         :publishing-function org-html-publish-to-html
         :headline-levels 4
         :auto-preamble t
         )
        ("doc"
         :base-directory "/doc/"
         :base-extension "org"
         :publishing-directory "/doc/html/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 6
         :auto-preamble t
         )
      ))


;; 搜索所有 fuzzy,搜索不到会很慢.
(setq org-link-search-must-match-exact-headline t)
(setq org-confirm-shell-link-function nil)

(provide 'org-config)
