(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/set")
(let ((default-directory "~/.emacs.d/elpa/"))
	(normal-top-level-add-subdirs-to-load-path))


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

;;复制c-c c-v c-x
(setq cua-rectangle-mark-key (kbd "C-S-<return>"))
(cua-mode t)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted
(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour



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
(setq tramp-default-user "root"
      tramp-default-host "192.168.1.101")

(add-to-list 'custom-theme-load-path "~/.emacs.d/elpa/zenburn-theme-20140212.457")
(load-theme 'zenburn t)

;(setq frame-title-format '(multiple-frames "%b" ("" invocation-name)))
;(require  'gentooish)
;(setq default-frame-alist
;'((top . 100) (left . 100)
;))


(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
; disable ido faces to see flx highlights.
(setq ido-use-faces nil)


(require 'projectile)
(setq projectile-use-native-indexing t)
(setq projectile-enable-caching t)
(setq projectile-show-paths-function 'projectile-hashify-with-relative-paths) 
(setq projectile-indexing-method 'native)
(projectile-global-mode)
(setq projectile-completion-system 'ido)
;(setq projectile-completion-system 'grizzl)
(setq projectile-cache-file "~/.projectile.cache.emacs")
(setq projectile-known-projects-file "~/.projectile-bookmarks.eld.emacs")




(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)


;; backup policies
(setq make-backup-files t)
(setq version-control t)
(setq kept-old-versions 2)
(setq kept-new-versions 5)
(setq delete-old-versions t)

(defvar backup-dir (expand-file-name "/home/.emacs.d/backup/"))
(defvar autosave-dir (expand-file-name "/home/.emacs.d/autosave/"))
(setq backup-directory-alist (list (cons ".*" backup-dir)))
(setq auto-save-list-file-prefix autosave-dir)
(setq auto-save-file-name-transforms `((".*" ,autosave-dir t)))


;(add-to-list 'default-frame-alist '(fullscreen . maximized))
(require 'org-config)
;;设置字体
(defun frame-setting ()
    (set-frame-font "Monaco-13")
    (set-fontset-font (frame-parameter nil 'font)
		      'gb18030 '("文泉驿等宽微米黑" . "unicode-bmp")))
 
(if (and (fboundp 'daemonp) (daemonp))
    (add-hook 'after-make-frame-functions
	      (lambda (frame)
		(with-selected-frame frame
		  (frame-setting))))
  (frame-setting))



(require 'smex) 
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(require 'tabbar-config)
(require 'fold-set)
;(require 'powerline)
;(require 'smart-mode-line-config) ;

(require 'nrepl-config)
;(require 'mysql-config)
(require 'base-config)
(setq eshell-aliases-file "~/.emacs.d/set/eshell-alias.el")

(require 'session)
(setq session-save-file "~/.session.emacs")
(add-hook 'after-init-hook 'session-initialize)

(setq desktop-dirname             "~/.emacs.d/"
      desktop-base-file-name      ".emacs.desktop"
      desktop-base-lock-name      "lock"
      desktop-path                (list desktop-dirname)
      desktop-save                t
      desktop-files-not-to-save   "^$" ;reload tramp paths
      desktop-load-locked-desktop t)
(load "desktop") 
(desktop-load-default) 
(desktop-read)

(global-set-key "%" 'match-paren)
          
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
	((looking-at "\\s\)") (forward-char 1) (backward-list 1))
	(t (self-insert-command (or arg 1)))))

;; (defun wy-go-to-char (n char)
;;   "Move forward to Nth occurence of CHAR.
;; Typing `wy-go-to-char-key' again will move forwad to the next Nth
;; occurence of CHAR."
;;   (interactive "p\ncGo to char: ")
;;   (search-forward (string char) nil nil n)
;;   (while (char-equal (read-char)
;; 		     char)
;;     (search-forward (string char) nil nil n))
;;   (setq unread-command-events (list last-input-event)))

;; (define-key global-map (kbd "C-c a") 'wy-go-to-char)







(require 'dired-config)
(require 'crontab-mode)
(add-to-list 'auto-mode-alist '("crontab$" . crontab-mode))

(setq mail-aliases t)

(require 'nginx-mode)
(add-to-list 'auto-mode-alist '("/nginx/" . nginx-mode))

(require 'cmd)
(require 'php-config)
(require 'misc-config)
(require 'objc-config)
(require 'recentf-config)
;(require 'smart-tab)
;(global-smart-tab-mode 1)

(speedbar-add-supported-extension ".clj")
(add-to-list 'speedbar-fetch-etags-parse-list
    '("\\.clj" . speedbar-parse-c-or-c++tag))
(require 'mode-line-config)
;(load "~/.emacs.d/elpa/nxhtml/autostart")


;(load "folding" 'nomessage 'noerror)
;(folding-mode-add-find-file-hook)
;  (folding-add-to-marks-list 'php-mode                "//{"  "//}"  nil t)
(require 'fold)



(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

;; 自动运行
(add-hook 'auto-save-hook 'session-save-session)
;; (add-hook 'auto-save-hook 'bookmark-save)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/bookmarks")
 '(session-use-package t nil (session))
 '(tabbar-separator (quote (0.5))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq bmkp-bmenu-state-file (convert-standard-filename "~/.bmk-bmenu-state-emacs.el"))
(setq bookmark-version-control t)
;;每当设置书签的时候都保存书签文件，否则只在你退出 Emacs 时保存 
(setq bookmark-save-flag 1)




(if (eq system-type 'windows-nt)
    (progn
      (prefer-coding-system 'utf-8)
      (setq file-name-coding-system 'gbk)
      (custom-set-faces
       '(default ((t (:family "\313\316\314\345" :foundry "outline" :slant normal :weight normal :height 143 :width normal)))))
      ))
