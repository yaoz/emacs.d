(require 'org-sou) ;sou bmk 链接定义
(add-hook 'org-mode-hook
          '(lambda ()
             (define-key org-mode-map [(control tab)] nil)))

(setq org-link-abbrev-alist
      '(("ku"  . "file:ku.org::*")
        ("ji"  . "file:ji.org::*")
        ("mie"  . "file:mie.org::*")
        ("dao"  . "file:dao.org::*")
        ("zefa"  . "file:zefa.org::*")

        ("xyb"  . "sou:../xyb/xyb.org::")
        ("zh"  . "sou:../xyb/zh.org::")
        ("ch"  . "sou:../xyb/ch.org::")

        ("za"  . "sou:../xiao/za::")

        ("tip"  . "file:tip.org::*")
        ("todo"  . "file:todo.org::*")
        ("php"  . "file:php.org::*")
        ("lisp"  . "file:lisp.org::*")
        ))

; Tags with fast selection keys
(setq org-tag-alist (quote (("发布" . ?f)
                            ("个人" . ?m)
                            ("工作" . ?w)
			    )))

; Allow setting single tags without the menu
(setq org-fast-tag-selection-single-key (quote expert))

; For tag searches ignore tasks with scheduled and deadline dates
(setq org-agenda-tags-todo-honor-ignore-options t)


(setq org-agenda-files (list "/doc/todo.org" "/fo/doc/todo.org" )) ;(file-expand-wildcards "/doc/todo*.org")
(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "完成(d!)" "取消(c!)")))  ;; 设置一下 todo 的关键字，| 左边的是未完成状态，右边是 done 的状态

(setq org-log-done t) ;; 变到 done 状态的时候，记录一下时间
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock)
(define-key global-map "\C-ca" 'org-agenda)
;; (define-key global-map "\C-cc" 'org-capture)


(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "/doc/todo.org" "Tasks")
         "* TODO %?\n" :clock-in t :clock-resume t)
        ("l" "Lisp" entry (file+headline "/doc/todo.org" "Lisp 笔记")
         "* TODO %?\n" :clock-in t :clock-resume t)
        ("p" "PHP" entry (file+headline "/doc/todo.org" "php 笔记")
         "* TODO %?\n" :clock-in t :clock-resume t)
        ("b" "笔记" entry (file+headline "/doc/todo.org" "tip 笔记")
         "* TODO %?\n" :clock-in t :clock-resume t)
        ("f" "佛法" entry (file+headline "/fo/doc/todo.org" "计划")
         "* TODO %?\n" :clock-in t :clock-resume t)
		))

;; org 换行
(setq org-startup-truncated nil)
;; (defun nolinum ()
;;   (global-linum-mode 0)
;; )
;; (add-hook 'org-mode-hook 'nolinum)
(add-hook 'org-mode-hook 'turn-off-auto-fill)

(setq max-specpdl-size 10000)

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

;; exe shell elisp 无 yes
(setq org-confirm-shell-link-function nil)
(setq org-confirm-elisp-link-function nil)



(require 'iimage)
(add-to-list 'iimage-mode-image-regex-alist
             (cons (concat "\\[\\[file:\\(~?" iimage-mode-image-filename-regex
                           "\\)\\]")  1))

(defun orgimage ()
  "display images in your org file"
  (interactive)
  (if (face-underline-p 'org-link)
      (set-face-underline-p 'org-link nil)
      (set-face-underline-p 'org-link t))
  (iimage-mode 'toggle))
;; (add-hook 'org-mode-hook 'iimage-mode)
;; (org-toggle-iimage-in-org)
;; (add-hook 'org-babel-after-execute-hook 'orgimage 'append)
;; (add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)

(require 'ob-ipython)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((ipython . t)
   (python . t)
   ;; other languages..
   ))
(setq python-shell-interpreter "ipython" )
(setq python-shell-prompt-detect-failure-warning nil)
(setq python-shell-completion-native-enable nil)
(setq org-confirm-babel-evaluate nil) 	;执行前不需要询问
;;; display/update images in the buffer after I evaluate
;; (add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)

(setq org-src-fontify-natively t)	;代码块中的语法高亮
(setq org-tags-match-list-sublevels nil) ;tag搜索不包含继承的子标题.
(provide 'org-config)
