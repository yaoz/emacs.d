;; 出错 package-refresh-contents 再 package-install
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(
		      s
                      bookmark+
                      ;; markdown-mode
                      ;; smart-tab
                      ;; auto-indent-mode
                      php-extras
                      php-mode
                      ;; smart-tab
                      ;; yasnippet
                      ;; multi-web-mode
                      ;; helm
                      ;; web-mode
                      nginx-mode
                      crontab-mode
                      remember
                      session
                      clojure-mode
                      midje-mode
                      clojure-test-mode
                      ac-nrepl
                      fuzzy
                      nrepl
                      projectile
                      ;; grizzl
                      expand-region
                      flx
                      flx-ido
                      ;; color-theme-solarized
                      ;; evil		;
                      ;; ace-jump-mode
                      color-theme
                      zenburn-theme
                      highlight-symbol
                      tabbar
                      ;; smart-mode-line
                      magit
                      smex
                      ;; smartparens
                      rainbow-delimiters
                      paredit
                      ))
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
