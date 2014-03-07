;(require 'edbi)
(require 'sql-completion)
(setq sql-interactive-mode-hook
      (lambda ()
           (define-key sql-interactive-mode-map "\t" 'comint-dynamic-complete)
           (sql-mysql-completion-init)))

;(autoload 'e2wm:dp-edbi "e2wm-edbi" nil t)
;(global-set-key (kbd "C-d") 'e2wm:dp-edbi)
;
;
(setq sql-connection-alist
      '((pool-a
         (sql-product 'mysql)
         (sql-server "127.0.0.1")
         (sql-user "yao")
         (sql-password "secure")
         (sql-database "test")
         (sql-port 3306))
        (pool-b
         (sql-product 'mysql)
         (sql-server "192.168.1.101")
         (sql-user "yao")
         (sql-password "secure")
         (sql-database "ana")
         (sql-port 3306))))

(defun sql-connect-preset (name)
  "Connect to a predefined SQL connection listed in `sql-connection-alist'"
  (eval `(let ,(cdr (assoc name sql-connection-alist))
    (flet ((sql-get-login (&rest what)))
      (sql-product-interactive sql-product)))))

(defun mysql-a ()
  (interactive)
  (sql-connect-preset 'pool-a))

(defun mysql-b ()
  (interactive)
  (sql-connect-preset 'pool-b))

(provide 'mysql-config)
