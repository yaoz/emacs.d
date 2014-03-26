(setq el-get-emacs "/usr/local/bin/emacs")
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(require 'el-get nil 'noerror)

;; (url-retrieve
;;  "https://github.com/dimitri/el-get/raw/master/el-get-install.el"
;;  (lambda (s)
;;    (end-of-buffer)
;;    (eval-print-last-sexp)))


;; auto-complete

(setq my-el-get-packages
      '(
        ;; yasnippet
        org-mode
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
        crontab-mode
        remember
        session
        clojure-mode
        midje-mode
        ;; clojure-test-mode  ;;;;;
        ;; ac-nrepl ;;;;;;
        fuzzy
        cider   ;; nrepl
        projectile
        ;; grizzl
        expand-region
        flx
        ;; flx-ido ;;;;;;;;;;;; 好像不需要
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


(el-get 'sync my-el-get-packages)


;; <?php
;; require_once (dirname(__FILE__)."/t_base.pt");
;; require_once (dirname(__FILE__)."/../xinshui.cls.php");
;; /**
;;  * @backupGlobals disabled
;;  */
;; class sql_gone extends my_test{ /* 测试失连问题 */

;;     function test_xs_data(){

;;     }


;; }

;; ?>
