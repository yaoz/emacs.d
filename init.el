(add-to-list 'load-path "~/.emacs.d/my")
(add-to-list 'load-path "~/.emacs.d/set")


(let ((default-directory "~/.emacs.d/elpa/"))
	(normal-top-level-add-subdirs-to-load-path))

(require 'package) ;; You might already have this line
;; http://mirrors.163.com/elpa/melpa/ gnu org 
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
;; (add-to-list 'package-archives '("elpy" . "http://jorgenschaefer.github.io/packages/"))
(package-initialize) ;; You might already have this line

(require 'cl)

;;    (ob-ipython w3m helm-dash helm-projectile helm markdown-mode zenburn-theme yasnippet yaml-mode web-mode tabbar scss-mode sass-mode php-mode org nginx-mode magit jump jinja2-mode jedi highlight-symbol flymake-ruby flycheck feature-mode expand-region ediprolog cucumber-goto-step company-irony company-c-headers coffee-mode bookmark+)))

;;company
;; http://blog.csdn.net/u013225150/article/details/51577568
(defvar my/packages '( zenburn-theme magit helm expand-region php-mode tabbar projectile nginx-mode ob-ipython helm-projectile yasnippet web-mode feature-mode elpy ) "默认安装的软件包")

(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
    (loop for pkg in my/packages
      when (not (package-installed-p pkg)) do (return nil)
      finally (return t)))

(unless (my/packages-installed-p)
    (message "%s" "Refreshing package database...")
    (package-refresh-contents)
    (dolist (pkg my/packages)
      (when (not (package-installed-p pkg))
    (package-install pkg))))





(load-theme 'zenburn t)
;; (setq python-indent-offset 4)

;; 改变Emacs要你回答yes的行为,按y或空格键表示yes，n表示no。
;; (fset 'yes-or-no-p 'y-or-n-p)

;;(require 'cloj-config)
(require 'org-config)
(require 'helm-config)
(require 'tabbar-config)
;(require 'smart-mode-line-config) ;
;(require 'mysql-config)
(require 'base-config)
(require 'dired-config)
(require 'php-config)
(require 'misc-config)
;(require 'objc-config)
(require 'recentf-config)
(require 'mode-line-config)
(require 'prj-config)
(require 'font-config)
(require 'run-config)
(require 'fold-set)
(add-hook 'after-init-hook 'global-company-mode)

(global-set-key [backtab]
    (lambda ()
      (interactive)
      (previous-multiframe-window)))

;c-tab 切换窗口
(global-set-key [(control tab)]
    (lambda ()
      (interactive)
      (next-multiframe-window)))

(setq *ib* "scratch\\|mess\\|Completions\\|ibuffer\\|nrepl-server\\|nrepl-error\\|nrepl-connection\\|nrepl-events\\|nrepl-doc\\|nrepl-macroexpansion\\|nrepl-result\\|Warnings\\|Help\\|tramp/ssh\\|inferior-lisp")


(add-to-list 'same-window-buffer-names "*nrepl*")

;(iswitchb-mode 1)
;(setq iswitchb-buffer-ignore '("^ " "*Messages*" "*Compile-Log*" "*GNU Emacs*","nrepl-server","nrepl-connection","nrepl-events","*Completions*"))

;; cua模式,会与c-c冲突,使用原有的复制模式,c-w 复制 c-v/y 粘贴,a-w 剪切

;; ;;复制c-c c-v c-x
;; (setq cua-rectangle-mark-key (kbd "C-S-<return>"))
;; (cua-mode t)
;; (setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
;; (transient-mark-mode 1) ;; No region when it is not highlighted
;; (setq cua-keep-region-after-copy t) ;; Standard Windows behaviour


;; https://www.emacswiki.org/emacs/CopyAndPaste
;; (setq mark-even-if-nonactive nil)

(global-set-key (kbd "C-v")                      'yank)
(global-set-key (kbd "C-w")                      'kill-ring-save)
(global-set-key (kbd "M-w")                      'kill-region)



(defun qiang-comment-dwim-line (&optional arg)
  "Replacement for the comment-dwim command.
If no region is selected and current line is not blank and we are not at the end of the line,
then comment current line.
Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))
(global-set-key "\M-;" 'qiang-comment-dwim-line)
(global-set-key (kbd "C-;") 'qiang-comment-dwim-line)  



(require 'tramp)
(setq tramp-default-method "ssh")
;; (setq tramp-default-method "scp")
;(setq tramp-default-user "root"
;      tramp-default-host "192.168.1.101")


;(setq frame-title-format '(multiple-frames "%b" ("" invocation-name)))
;(require  'gentooish)
;(setq default-frame-alist
;'((top . 100) (left . 100)
;))



;; backup policies
(setq make-backup-files t)
(setq version-control t)
(setq kept-old-versions 2)
(setq kept-new-versions 5)
(setq delete-old-versions t)

(defvar backup-dir (expand-file-name "~/.emacs.d/backups/"))
(defvar autosave-dir (expand-file-name "~/.emacs.d/autosave/"))
(setq backup-directory-alist (list (cons ".*" backup-dir)))
(setq auto-save-list-file-prefix autosave-dir)
(setq auto-save-file-name-transforms `((".*" ,autosave-dir t)))

;; (add-to-list 'backup-directory-alist
;;              (cons "~/.emacs.d/backups/"))
;; (setq tramp-backup-directory-alist backup-directory-alist)


(add-to-list 'backup-directory-alist
             (cons tramp-file-name-regexp nil))

;(add-to-list 'default-frame-alist '(fullscreen . maximized))


;(require 'powerline)

(setq eshell-aliases-file "~/.emacs.d/set/eshell-alias.el")


(setq desktop-dirname             "~/.emacs.d/"
      desktop-base-file-name      ".emacs.desktop"
      desktop-base-lock-name      "lock"
      desktop-path                (list desktop-dirname)
      desktop-save                t
      desktop-files-not-to-save   "^$" ;reload tramp paths
      desktop-load-locked-desktop t)
    (desktop-save-mode 1)


(global-set-key  (kbd "C-%") 'match-paren)
          

;; (setq mail-aliases t)


;(require 'smart-tab)
;(global-smart-tab-mode 1)

;(speedbar-add-supported-extension ".clj")
;(add-to-list 'speedbar-fetch-etags-parse-list
;    '("\\.clj" . speedbar-parse-c-or-c++tag))

;(load "~/.emacs.d/elpa/nxhtml/autostart")


;(load "folding" 'nomessage 'noerror)
;(folding-mode-add-find-file-hook)
;  (folding-add-to-marks-list 'php-mode                "//{"  "//}"  nil t)
(require 'fold)




;; 自动运行
(add-hook 'auto-save-hook 'session-save-session)






 ;; '(bmkp-last-as-first-bookmark-file "~/.emacs.d/bookmarks")
;; (add-hook 'auto-save-hook 'bookmark-save)
(setq bmkp-bmenu-state-file (convert-standard-filename "~/.bmk-bmenu-state-emacs.el"))
(setq bookmark-version-control t)
;;每当设置书签的时候都保存书签文件，否则只在你退出 Emacs 时保存 
(setq bookmark-save-flag 1)



(require 'nginx-mode)
(add-to-list 'auto-mode-alist '("/nginx/" . nginx-mode))


;(require 'crontab-mode)
;(add-to-list 'auto-mode-alist '("crontab$" . crontab-mode))

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;(require 'session)
;(setq session-save-file "~/.session.emacs")
;(add-hook 'after-init-hook 'session-initialize)

(require 'magit)
;(setq magit-last-seen-setup-instructions "1.4.0")
(setq magit-auto-revert-mode nil)



;;(add-hook 'after-init-hook #'global-flycheck-mode)
(require 'cmd)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (company-php php-mode clojure-mode elpy company-jedi jedi flx-ido kotlin-mode company ess zenburn-theme magit helm expand-region tabbar projectile nginx-mode ob-ipython helm-projectile yasnippet web-mode feature-mode)))
 '(tabbar-separator (quote (0.5))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
