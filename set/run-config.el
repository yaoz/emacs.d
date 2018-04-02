;; 运行当前buffer
(defun run-current-file ()
  (interactive)
  (let* (
         (suffixMap
          `(
            ("php" . "php")
            ("pt" . "phpunit")
            ("pl" . "perl")
            ("py" . "python3")
            ("py3" . ,(if (string-equal system-type "windows-nt") "c:/Python32/python.exe" "python3"))
            ("rb" . "ruby")
	    ("rails" . "rails r ")
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
                                             ;; (shell-command (concat cmdStr " -o " fName-no-houzhui ".png"))
                                             (graphviz-dot-preview)
                                             )) ;图片
             (t (shell-command cmdStr)))
            )
        (message "No recognized program file suffix for this file.")
        ))
    ))

(global-set-key (kbd "<f5>") 'run-current-file)

(provide 'run-config)
