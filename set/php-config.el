(require 'php-mode)
(setq php-completion-file "~/.emacs.d/php-completion-file")
(eval-after-load 'php-mode
  '(progn
     (define-key php-mode-map (kbd "M-p")  'php-complete-function)))

(add-hook 'html-mode-hook 'turn-off-auto-fill)

(add-to-list 'auto-mode-alist '("\\.tpl\\'" . html-mode))
(require 'php-eldoc)
(add-to-list 'auto-mode-alist '("\\.pt$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
;(add-to-list 'auto-mode-alist '("\\.cls\\.php$" . php-mode))

;(require 'web-mode)
;(require 'smarty-mode)
 	
;(setq auto-mode-alist (append '(("\\.tpl$" . smarty-mode)) auto-mode-alist))
;(add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))



;(defun mp-add-python-keys ()
;  (local-set-key [tab] 'indent-for-tab-command))
;(add-hook 'php-mode-hook 'mp-add-python-keys)

;; (require 'multi-web-mode)
;; (setq mweb-default-major-mode 'php-mode)
;; (setq mweb-tags '((html-mode "<<<END" "END;")
;;                   (js-mode "<script +\\(type=\"text/javascript\"\\|language=\"javascript\"\\)[^>]*>" "</script>")
;;                   (css-mode "<style +type=\"text/css\"[^>]*>" "</style>")))
;; (setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5"))
;; (multi-web-global-mode 1)



;; (setq-default indent-tabs-mode nil)
;; (setq-default tab-width 4)
;; (setq c-basic-offset 4)
;; (setq c-basic-indent 4)

(add-hook 'php-mode-hook 'my-php-mode-hook)
(defun my-php-mode-hook ()
  (setq-default indent-tabs-mode nil)
  (setq-default tab-width 4)
  (setq c-basic-offset 4)
  (setq c-basic-indent 4))


;; (defun my-php-mode-hook ()
;;   (setq indent-tabs-mode t)
;;   (let ((my-tab-width 4))
;;     (setq tab-width my-tab-width)
;;     (setq c-basic-indent my-tab-width)
;;     (set (make-local-variable 'tab-stop-list)
;;          (number-sequence my-tab-width 200 my-tab-width))))

(provide 'php-config)
