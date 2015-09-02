;; 自动补全
;; 快捷键 c-m-i
(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)
(setq company-idle-delay nil) ; never start completions automatically
;; (global-set-key (kbd "M-TAB") #'company-complete) ; use meta+tab, aka C-M-i, as manual trigger
(global-set-key (kbd "C-M-i") #'company-complete) ; use meta+tab, aka C-M-i, as manual trigger
;; (global-set-key (kbd "C-u") #'company-complete) ; use meta+tab, aka C-M-i, as manual trigger
;; (global-set-key (kbd "TAB") #'company-indent-or-complete-common) ;没那么智能
;; (global-company-mode)

(add-hook 'cider-repl-mode-hook #'paredit-mode)

(defun jj ()
  (interactive)
  (delete-other-windows)
  (cd "/home/jj" )
  (find-file "/home/jj/src/jj/core.clj")
  (split-window-right)
  (other-window 1)
  ;; (if (buffer-exists "*nrepl*") (switch-to-buffer "*nrepl*") (l2))
  (l1)
  )

(defun l1 ()
  "nrepl 连接本地"
  (interactive)
  (if (buffer-exists "*cider-repl 127.0.0.1*")
      (switch-to-buffer "*cider-repl 127.0.0.1*")
    (cider-connect "127.0.0.1" "4001")))

(defun aa ()
  (interactive)
  (nrepl-interactive-eval "(print 111)"))
;; nrepl-interactive-eval-print 打印到当前


(defun nrepl-eval (form)
  (interactive)
  (clj-load)
  (let ((result-buffer (nrepl-popup-buffer "*nrepl-result*" nil)))
    (nrepl-send-string (format "(clojure.pprint/pprint %s)" form)
                       (nrepl-popup-eval-out-handler result-buffer)
                       (nrepl-current-ns)
                       (nrepl-current-tooling-session))))

(defun uv () (interactive) (nrepl-eval "(log.view/uv 14)"))
(defun uvdir () (interactive) (nrepl-eval "(log.view/uvdir)"))
(defun gsr () (interactive) (nrepl-eval "(log.view/gsr 200)"))
(defun ipduan () (interactive) (nrepl-eval "(log.view/?ipduan)"))

(defun ex () (interactive) (nrepl-eval "(log.ex/-main)"))


(defun clj-load () 
  (interactive)
  (nrepl-load-file "/home/src/log/src/log/ex.clj")
  (nrepl-load-file "/home/src/log/src/log/view.clj")
  (nrepl-load-file "/home/src/log/src/log/cli.clj"))


(provide 'cloj-config)
