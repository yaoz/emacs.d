(require 's)
(defun buffer-exists (bufname) (not (eq nil (get-buffer bufname))))

(defun dos2unix ()
  "Not exactly but it's easier to remember"
  (interactive)
  (set-buffer-file-coding-system 'unix 't) )

    ;; (defun dos2unix (buffer)
    ;;   "Automate M-% C-q C-m RET C-q C-j RET"
    ;;   (interactive "*b")
    ;;   (save-excursion
    ;;     (goto-char (point-min))
    ;;     (while (search-forward (string ?\C-m) nil t)
    ;;       (replace-match (string ?\C-j) nil t))))

;  (setq default-directory "/home/src/log" )
;  (cd "/ssh:root@l2:/home/src/log" )
;  (find-file "/ssh:root@l2:/home/src/log/src/log/fx.clj"))
(defun fx ()
  (interactive)
  (delete-other-windows)
  (cd "/home/src/log" )
  (find-file "/home/src/log/src/log/fx.clj")
  (split-window-right)
  (other-window 1)
  ;; (if (buffer-exists "*nrepl*") (switch-to-buffer "*nrepl*") (l2))
  (l2)
  )

(defun file-name ()
  "当前文件名,带路径"
  (concat default-directory (buffer-name)))

(defun dir-name ()
  "当前带路径"
  (concat default-directory))

(defun reopen ()
  "重新读取文件,find-alter-file c-x c-v"
  (interactive)
  (find-file (concat default-directory (buffer-name)))
  )

(setq password-cache-expiry nil)


(defadvice display-message-or-buffer (before ansi-color activate)
  "Process ANSI color codes in shell output."
  (let ((buf (ad-get-arg 0)))
    (and (bufferp buf)
         (string= (buffer-name buf) "*Shell Command Output*")
         (with-current-buffer buf
           (ansi-color-apply-on-region (point-min) (point-max))))))

(defun exec-to-mini (cmdStr)
  (let ((rs (shell-command-to-string cmdStr )))
    (message 
     (replace-regexp-in-string 
      "\n\n" "\n" 
      (replace-regexp-in-string 
       "^\n$" "" 
       (replace-regexp-in-string 
	"Linux.*\\|the .*\\|you have new.*\\|individual.*\\|permitt.*\\|connect.*\\|debian.*\\|last login.*\\|spawn ssh.*\\|logout\\|yao@.*exit.*\\|exit\\|\r" ""  rs))
     )
    )))

;; mini最大高度
(setq max-mini-window-height 10)

(defun ze () (interactive) (find-file "/home/fo/doc/zefa.org"))
(defun ji () (interactive) (find-file "/home/fo/doc/ji.org"))
(defun ku () (interactive) (find-file "/home/fo/doc/ku.org"))
(defun xinshui1 () (interactive) (find-file "/ssh:yao@f1#2746:/srv/fenzhi/xinshui1.php"))
(defun xinshuicls () (interactive) (find-file "/ssh:yao@f1#2746:/srv/fenzhi/xinshui.cls.php"))
(defun iptables-f1 () (interactive) (find-file "/ssh:yao@f1#2746:/etc/iptables.up.rules"))
;; (defun iptablesrestart () (interactive) (cd "~/" ) (exec-to-mini "expect /srv/bin/f1.exp \"sudo /sbin/iptables-restore < /etc/iptables.up.rules\""))
(defun iptablesrestart () (interactive) (shell-command "sudo iptables -L -n |wc -l;sudo /sbin/iptables-restore < /etc/iptables.up.rules;sudo iptables -L -n |wc -l;"))
;; (defun iptablesrestart () (interactive) (shell-command "sudo /var/log/z"))
;; /ssh:yao@f1#2746|sudo:root@f1#2746:
(defun cc () (interactive) (shell-command "expect /srv/bin/f1.exp \"ls --color=never\""))
(defun cmdls () (interactive) (shell-command "ls /home"))

(defun iptables-l2 () (interactive) (find-file "/ssh:root@l2:/home/fx/ex/iptables"))
(defun crontab-l2 () (interactive) (find-file "/ssh:root@l2:/etc/crontab"))
(defun rmcache () (interactive) (shell-command "rm /srv/fenzhi/cache/*.tpl.php;rm /srv/gz/cache/*.tpl.php"))
(defun toyao () (interactive) (shell-command "chown -R yao:yao ."))
(defun nginx () (interactive) (find-file "/etc/nginx/nginx.conf"))

;; (defun up-ex () (interactive) 		;上传导出文件
;;   (shell-command "expect /srv/bin/l2.exp \"cd /home/fx;
;; tar -czvf ex.tar.gz ex;
;; ls -l ex.tar.gz;
;; scp -P 35072 ex.tar.gz yao@f3:/home/yao\""))

(defun up-ex () (interactive) 		;上传导出文件
  (shell-command "cd /home/fx;
tar -czvf ex.tar.gz ex;
scp -P 35072 ex.tar.gz yao@f3:/home/yao"))

;; (defun up-ex () (interactive) 
;;   (shell-command "expect /srv/bin/l2.exp \"scp -P 35072 /home/fx/ex.tar.gz yao@f3:/home/yao\""))

(defun todo () (interactive) (find-file "/doc/todo.org"))
(defun tip () (interactive) (find-file "/doc/tip.org"))
(defun lisp-tip () (interactive) (find-file "/doc/lisp.org"))
(defun fxdir () (interactive) (dired "/ssh:root@l2:/home/fx"))
(defun logdir () (interactive) (dired "/home/src/log"))
;(set-default 'tramp-default-proxies-alist (quote ((".*" "\\`root\\'" "/ssh:%h:"))))
;(add-to-list 'tramp-default-proxies-alist '("\\'.*\\.firewalled\\.site\\.edu\\’” nil “/ssh:proxy\\.firewalled\\.site\\.edu:”))
;(add-to-list 'tramp-default-proxies-alist '("myf1" nil "/ssh:%u@f1#2746"))
;(add-to-list
;  'tramp-default-proxies-alist
;  '("remotedomain.com" "root" "/ssh:%h:"))
(defun f3dir () (interactive) (dired "/ssh:yao@f3#35072:/home/yao"))

(defun git ()
  (interactive)
  (magit-status ))

(defun mail2 ()
  (interactive)
  (my-mail "/ssh:root@l2:/var/mail/yao"))

(defun mail1 ()
  (interactive)
  (my-mail "/var/mail/yao"))

(defun my-mail (file)
  (interactive)
  (rmail-input file)
  (delete-other-windows)
  (rmail-summary))





(defun run-current-file ()
  (interactive)
  (let* (
         (suffixMap
          `(
            ("php" . "php")
            ("pt" . "phpunit")
            ("pl" . "perl")
            ("py" . "python")
            ("py3" . ,(if (string-equal system-type "windows-nt") "c:/Python32/python.exe" "python3"))
            ("rb" . "ruby")
            ("js" . "node")             ; node.js
            ("sh" . "bash")
            ("exp" . "expect")
            ("ml" . "ocaml")
            ("vbs" . "cscript")
            ;; ("m" . "echo ")
            ("m" . "gcc `gnustep-config --objc-flags` -std=c99 -lgnustep-base -o /tmp/z")
	    ("swift" . "xcrun swift")
            ("dot" . "dot -Tpng ")             ;无用
            )
          )
         (fName (replace-regexp-in-string ".*:" "" (buffer-file-name))) ;去除主机名,可以远程执行
         (fName-no-houzhui (replace-regexp-in-string "\\..*" "" fName)) ;去除后缀的文件名
         (fSuffix (file-name-extension fName)) ;后缀
         (progName (cdr (assoc fSuffix suffixMap))) ;程序名
         (cmdStr (concat progName " \""   fName "\"")) ;命令行
         )
    ;; (when (buffer-modified-p)
    ;;   (when (y-or-n-p "Buffer modified. Do you want to save first?")
    ;;       (save-buffer) ) )
    (when (buffer-modified-p)
      (save-buffer))
    (if (string-equal fSuffix "el") ; special case for emacs lisp
        (load (file-name-sans-extension fName))
      (if progName
          (progn
            (message (concat "Running… " fSuffix progName "@" fName))
            (cond                       ;根据后缀执行命令
             ((string-equal fSuffix "m") (shell-command (concat cmdStr ";/tmp/z"))) ;  objc
             ((string-equal fSuffix "dot") (progn
                                             ;; (message (concat cmdStr " -o " fName-no-houzhui ".png"))
                                             (shell-command (concat cmdStr " -o " fName-no-houzhui ".png"))
                                             (graphviz-dot-preview)
                                             )) ;图片
             (t (shell-command cmdStr)))
            )
        (message "No recognized program file suffix for this file.")
        ))
    ))

(global-set-key (kbd "<f5>") 'run-current-file)

(defun current-line ()
  (interactive)
  (let (p1 p2 myLine)
    (setq p1 (line-beginning-position) )
    (setq p2 (line-end-position) )
    (setq myLine (buffer-substring-no-properties p1 p2))
    (message (replace-regexp-in-string "%" "%%" myLine))
    ))

;; %20

(defun my-browse-url ()
  "直接打开链接"
  (interactive)
  (let ()
    (shell-command (concat "google-chrome --user-data-dir=/home/yao/.google " (current-line))
    )))
(global-set-key (kbd "<f9>") 'my-browse-url)

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome"
      browse-url-generic-args '("--user-data-dir=/home/yao/.google"))


(defun my-jump ()
  "跳转到书签"
  (interactive)
  (bookmark-jump (s-trim (replace-regexp-in-string "file:" "" (current-line)))))
(global-set-key (kbd "<f10>") 'my-jump)
;无用,org自带跳转
(defun my-open ()
  "跳转到文件"
  (interactive)
  (find-file (current-line)))
(global-set-key (kbd "<f12>") 'my-open)

(defun my-exec-line ()
  "运行一行sh"
  (interactive)
  (delete-other-windows)
  (split-window-below)
  (other-window 1)
  (switch-to-buffer "*Shell Command Output*")
  (other-window 1)
  (shell-command (current-line) "*Shell Command Output*") 
  )
(global-set-key (kbd "<f11>") 'my-exec-line)


(defun sudo ()
  "远程文件 root sudo 读写"
  (interactive)
  (let ((fName (replace-regexp-in-string "@\\(.*\\):/" "@\\1|sudo:\\1:/" (buffer-file-name))))
    (find-alternate-file fName)
    (message fName)))
  

(defun nginx-reload () (interactive) (shell-command "sudo /etc/init.d/nginx reload"))
(defun nginx-restart () (interactive) (shell-command "sudo /etc/init.d/nginx restart"))


(defadvice kill-line (around merge-line (&optional arg) activate)
  "M-^合并上一行，M-0 M-^合并下一行。其实搜索join就能找到 kill-line 时,光标在行末,且该行不是空行,把下面一行连接在一起（可以接受一个数字参数，把下面 N 行连接在一起）；否则和平时一样 http://forum.ubuntu.org.cn/viewtopic.php?f=68&t=375914 "
  (interactive "P")
  (let ((n (or arg 1)))
    (if (and (null (bolp)) (eolp))
        (while (< 0 n)
          (delete-char 1)
          (delete-horizontal-space)  
	  (insert " ")
          (if (< 1 n) (end-of-line))
          (setq n (1- n)))
      ad-do-it)))

;; (require 'helm)
;; (require 'helm-config)

;; (require 'smart-tab)
;; (setq smart-tab-using-hippie-expand t)
;; (global-smart-tab-mode t)

;; https://github.com/joonhwan/dotEmacs/blob/master/my-projectile.el#L55
;; (setq projectile-enable-caching t
;;       projectile-indexing-method 'alien
;;       projectile-svn-command (concat find-program " . -type f -print0")
;;       projectile-generic-command (concat find-program " . -type f -print0")
;;       )

;; (setq projectile-use-native-indexing nil)


     ;;; Final version: while
(defun count-words-example (beginning end)
  "Print number of words in the region."
  (interactive "r")
  (message "Counting words in region ... ")
     ;;; 1. Set up appropriate conditions.
  (save-excursion
    (let ((count 0))
      (goto-char beginning)
     ;;; 2. Run the while loop.
      (while (and (< (point) end)
		  (re-search-forward "\\w+\\W*" end t))
	(setq count (1+ count)))
     ;;; 3. Send a message to the user.
      (cond ((zerop count)
	     (message
	      "The region does NOT have any words."))
	    ((= 1 count)
	     (message
	      "The region has 1 word."))
	    (t
	     (message
	      "The region has %d words." count))))))


(defun cls-name ()
  "得到类名,并显示"
  (interactive)
  (let ((current-point (point)))
    (if (re-search-backward "\\(class\\)\s" nil t) ;[a-z]+
	(progn
	  ;; (forward-word) (forward-word)
	  ;; (message "函数名 %s"  (thing-at-point 'symbol))
	  (message "函数名 %s"  (thing-at-point 'line))
	  )
	(message "没找到") )
    (goto-char current-point) ) )


(defun fun-name ()
  "得到函数名,并显示"
  (interactive)
  (let ((current-point (point)))
    (if (re-search-backward "\\(function\\|defun\\)\s" nil t) ;[a-z]+
	(progn
	  ;; (forward-word) (forward-word)
	  ;; (message "函数名 %s"  (thing-at-point 'symbol))
	  (message "函数名 %s"  (thing-at-point 'line))
	  )
	(message "没找到") )
    (goto-char current-point) ) )


(defun goto-fun ()
  (interactive)
  (if (re-search-backward "\\(function\\|defun\\)\s" nil t) ;[a-z]+
      (message "移动")
      (message "没找到")))


(defun tpl-name-fun (fun-search)
  (let ((current-point (point)))
    (if (funcall fun-search "$tpl_name\s*=\s*['\"][a-z]\\|tpl->fetch(\s*['\"][a-z]" nil t) ;[a-z]+
	(progn
	  (if (eq fun-search 're-search-backward) (re-search-forward "['\"]" nil t)) ;或者可以到行首
	  (message "模板名 %s"  (thing-at-point 'filename)) ;symbol 有可能读错
	  )
	(message "没找到") )
    (goto-char current-point)
 ) )

(defun tpl-name ()
  (interactive)
  (tpl-name-fun 're-search-forward)
)

(defun tpl-name-b ()
  (interactive)
  (tpl-name-fun 're-search-backward)
)
;; $tpl_name = "gz3/gz_xs.tpl";
;; $html = $this->tpl->fetch("tpl_name);

(defun buffer-mode ()
  "显示,复制 buffer-mode"
  (interactive)
  (kill-new (message "%s" major-mode))
  )


(defun buffer-name1 ()
  "显示,复制 buffer-name"
  (interactive)
  (kill-new (message "%s" (buffer-name))))

(defun buffer-name-path ()
  "显示,复制 buffer-name"
  (interactive)
  (kill-new (message "%s" (file-name))))

(defun buffer-dir ()
  "显示,复制 buffer-name"
  (interactive)
  (kill-new (message "%s" (dir-name))))


(load-library "hideshow")
(add-hook 'c-mode-common-hook   'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'java-mode-hook       'hs-minor-mode)
(add-hook 'lisp-mode-hook       'hs-minor-mode)
(add-hook 'perl-mode-hook       'hs-minor-mode)
(add-hook 'sh-mode-hook         'hs-minor-mode)
(add-hook 'php-mode-hook         'hs-minor-mode)
(add-hook 'objc-mode-hook         'hs-minor-mode)
(global-set-key (kbd "C-_") 'hs-hide-all)
(global-set-key (kbd "C-+") 'hs-show-all)
(global-set-key (kbd "<backtab>") 'hs-toggle-hiding)
(global-set-key (kbd "C-\\") 'hs-toggle-hiding)

(defvar hs-special-modes-alist
  (mapcar 'purecopy
  '((objc-mode "{" "}" nil nil))))


;    (setq auto-save-interval 5
;          auto-save-timeout 1)


;; mini 自动补全
(global-set-key [(meta ?/)] 'hippie-expand)
(setq hippie-expand-try-functions-list 
      '(try-expand-dabbrev
	try-expand-dabbrev-visible
	try-expand-dabbrev-all-buffers
	try-expand-dabbrev-from-kill
	try-complete-file-name-partially
	try-complete-file-name
	try-expand-all-abbrevs
	try-expand-list
	try-expand-line
	try-complete-lisp-symbol-partially
	try-complete-lisp-symbol))

;; 搜索历史长度,好像不能用
(setq history-length 250)

(require 'generic-x)

(define-generic-mode 'sphinx-mode                         ;; name of the mode to create
  ;; '(?#) ;; '(("#")) ;; nil
  ()
  ;; '(("#" . "\\$"))
  '("source" "index" "indexer" "searchd" "type" "sql_host" "sql_user" "sql_pass" "sql_db" "sql_port" "sql_query_pre" "sql_query"
    "path" "docinfo" "mlock" "morphology" "min_word_len" "charset_type" "charset_table" "min_prefix_len" "ngram_len" "ngram_chars"
    "html_strip" "sql_attr_uint" "sql_attr_timestamp" "sql_query_info" "mem_limit" "searchd" "listen" "listen" "log" "query_log" "read_timeout" "client_timeout" "max_children" "pid_file" "max_matches" "seamless_rotate" "preopen_indexes" "unlink_old" "mva_updates_pool" "max_packet_size" "max_filters" "max_filter_values" "select" "from" "where" "set" "utf8" "session" "query_cache_type" "OFF" "left" "join" "as" "count" "max" "names" "replace" "into" "and" "or" "limit" "order" "by" "desc" "asc" "id")                     ;; 关键词
  '(
    ("\\(#.*\\)" 1 'font-lock-comment-face)
    ("\\b[0-9]+\\b" . font-lock-constant-face)
    ("[,\\.:{}=()<>]" . 'font-lock-type-face))     ;; ';' is a built-in 
  '("sphinx\\.conf$")                      ;; files for which to activate this mode 
  ;; (list (lambda () (setq comment-start "#")))  
  nil
  )

;; (electric-indent-mode 1)
;; (setq auto-indent-on-visit-file t) ;; If you want auto-indent on for files
;; (require 'auto-indent-mode)
;; (add-hook 'generic-mode-find-file-hook 'auto-indent-mode)
;; (setq indent-tabs-mode t)

;;      (defun sample-smie-rules (kind token)
;;        (pcase (cons kind token)
;;          (`(:elem . basic) sample-indent-basic)
;;          (`(,_ . ",") (smie-rule-separator kind))
;;          (`(:after . ":=") sample-indent-basic)
;;          (`(:before . ,(or `"begin" `"(" `"{")))
;;           (if (smie-rule-hanging-p) (smie-rule-parent)))
;;          (`(:before . "if")
;;           (and (not (smie-rule-bolp)) (smie-rule-prev-p "else")
;;                (smie-rule-parent))))

 ;;    (setq-default indent-tabs-mode nil)

 ;; (setq tab-width 4) ; or any other preferred value
 ;;    (setq tab-width 4) ; or any other preferred value
 ;;    (defvaralias 'c-basic-offset 'tab-width)
 ;;    (defvaralias 'cperl-indent-level 'tab-width)

;; ;; (customize-variable (quote tab-stop-list))
;; (custom-set-variables
;;   ;; custom-set-variables was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  '(tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))))

(defun file-time()
  (interactive)
  (let ((rs (shell-command-to-string (concat "ls -l " (file-name)))))
    (message 
     (replace-regexp-in-string 
      ".*root\\|yao" "" 
      (replace-regexp-in-string 
       "\/.*" "" 
       rs)
     )
    )))

;; (defun buffer-mode1 (buffer-or-string)
;;   "返回major buffer-mode 名"
;;   (with-current-buffer buffer-or-string
;;      major-mode))

(defun dos2unixall (buffer-or-string)
  ;; (if (string-equal "html-mode" (with-current-buffer buffer-or-string major-mode))
  (if (string-match "\\.php" (buffer-name buffer-or-string))
      (progn (switch-to-buffer (buffer-name buffer-or-string))
             ;; (message (buffer-name buffer-or-string))
             (let ((enc (symbol-name (symbol-value 'buffer-file-coding-system))))
               (message "====== %S" enc)
               ;; (if (or (string-equal "utf-8-dos" enc) (string-equal "utf-8-with-signature-dos" enc) (string-equal "raw-text-dos" enc) (string-equal "chinese-gbk-dos" enc))
               (if (string-match "dos" enc)
                   (set-buffer-file-coding-system 'unix 't))
               ) )))

;; (message "%s" (symbol-value 'buffer-file-coding-system))
(dos2unixall (get-buffer "map1.php"))
;; (mapcar (function dos2unixall) (buffer-list))


;; use apsell as ispell backend  
;; (setq-default ispell-program-name "aspell")  
;; use American English as ispell default dictionary  
(ispell-change-dictionary "american" t) 

;; 字体大小,滚轮, font
(global-set-key (kbd "<C-mouse-4>") 'text-scale-increase)
(global-set-key (kbd "<C-mouse-5>") 'text-scale-decrease)



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

(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
	((looking-at "\\s\)") (forward-char 1) (backward-list 1))
	(t (self-insert-command (or arg 1)))))



;(require 'yasnippet)
;(setq yas-snippet-dirs
;      '("~/.emacs.d/snippets/"                 ;; personal snippets
;      ;; "~/.emacs.d/elpa/yasnippet-20140314.255/snippets/"
;        ))
;(yas/reload-all)
;; (yas/global-mode 1)


(org-display-inline-images t t)


(global-set-key [f2] 'projectile-grep)


(add-hook 'swift-mode-hook 'company-mode)

(global-set-key (kbd "C-i") 'company-complete)
(global-set-key (kbd "M-i") 'company-complete)

;; (defun complete-or-indent ()
;;     (interactive)
;;     (if (company-manual-begin)
;;         (company-complete-common)
;;       (indent-according-to-mode)))


(defun indent-or-complete ()
  (interactive)
  (if (looking-at "\\_>")
      (company-complete-common)
    (indent-according-to-mode)))

;; (global-set-key [tab] 'complete-or-indent)
(global-set-key [tab] 'indent-or-complete)
(provide 'cmd)


