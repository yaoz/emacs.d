(require 'clojure-mode)
(require 'nrepl)

(add-hook 'nrepl-interaction-mode-hook
  'nrepl-turn-on-eldoc-mode)

;(setq nrepl-popup-stacktraces-in-repl t)
(setq nrepl-history-file "~/.emacs.d/nrepl-history")

(require 'paredit)
(add-hook 'nrepl-mode-hook 'paredit-mode)

(autoload 'nrepl-connect "nrepl"
  "nrepl mode" t nil)

(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))
;(add-to-list 'load-path "/root/.emacs.d/midje-mode-master/")
;(require 'nrepl-ritz) ;; after (require 'nrepl)
;; Ritz middleware
;(define-key nrepl-interaction-mode-map (kbd "C-c C-j") 'nrepl-javadoc)
;(define-key nrepl-mode-map (kbd "C-c C-j") 'nrepl-javadoc)
;(define-key nrepl-interaction-mode-map (kbd "C-c C-a") 'nrepl-apropos)
;(define-key nrepl-mode-map (kbd "C-c C-a") 'nrepl-apropos)
;(set-default-font "-outline-Lucida Console-normal-normal-normal-mono-*-*-*-*-*-*-iso10646-1" 1)

(setq nrepl-hide-special-buffers t)
(require 'rainbow-delimiters)

(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'nrepl-mode-hook 'rainbow-delimiters-mode)


(defun turn-on-paredit () (paredit-mode 1))
(add-hook 'clojure-mode-hook 'turn-on-paredit)
(add-hook 'nrepl-mode-hook 'turn-on-paredit)

(eval-after-load 'paredit
  '(progn
     (define-key paredit-mode-map (kbd "<M-right>") 'paredit-forward-slurp-sexp)
     (define-key paredit-mode-map (kbd "<M-left>")  'paredit-forward-barf-sexp)
     (define-key paredit-mode-map (kbd "<C-right>") nil)
     (define-key paredit-mode-map (kbd "<C-left>")  nil)))


(require 'ac-nrepl)
(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
(add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'nrepl-mode))


(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions '(auto-complete)))
(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)

(add-hook 'nrepl-mode-hook 'set-auto-complete-as-completion-at-point-function)
(add-hook 'nrepl-interaction-mode-hook 'set-auto-complete-as-completion-at-point-function)
(define-key nrepl-interaction-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc)

;出错
;; (require 'midje-mode)
;; (require 'clojure-jump-to-file)
;; (add-hook 'clojure-mode-hook 'midje-mode)


(provide 'nrepl-config)
