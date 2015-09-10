(setq el-get-emacs "/usr/local/bin/emacs")
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(require 'el-get nil 'noerror)

(setq my-el-get-packages
      '(
        ;; yasnippet
;;        org-mode
        s
        bookmark+
        ;; markdown-mode
        ;; smart-tab
        ;; auto-indent-mode
        ;; php-extras ;;;;;
        php-mode
        ;; smart-tab
        ;; yasnippet
        ;; multi-web-mode
        ;; helm
        ;; web-mode
        nginx-mode
;        crontab-mode
 ;;       remember ;;slow
        session
        fuzzy
       	
        ;; cider   ;; nrepl
	;; clojure-mode
	;; midje-mode
        ;; clojure-test-mode  ;;;;;
 
        projectile
        ;; grizzl
        expand-region
        flx
        ;; flx-ido ;;;;;;;;;;;; 好像不需要
        ;; color-theme-solarized
        ;; evil		;
        ;; ace-jump-mode
        color-theme
        ;;zenburn-theme
        highlight-symbol
        tabbar
        ;; smart-mode-line
        magit
        smex
        ;; smartparens
        rainbow-delimiters
        paredit
        ))

;;(el-get-bundle org-mode)
(el-get 'sync my-el-get-packages)

(el-get-bundle zenburn-theme
;  :url "/root/dl/zenburn-theme.el"
;  :url "https://github.com/bbatsov/zenburn-emacs/raw/master/zenburn-theme.el"
  :url "https://raw.githubusercontent.com/bbatsov/zenburn-emacs/master/zenburn-theme.el"
)
;  (load-theme 'zenburn t))
;(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
;(el-get-bundle zenburn-theme)
(provide 'el-get-config)
