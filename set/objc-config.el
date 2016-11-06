(add-to-list 'ac-modes 'objc-mode) 
(add-to-list 'auto-mode-alist '("\\.pch\\'" . objc-mode))

;; http://bretthutley.com/programming/emacs/opening-a-cobjective-cc-header-file-in-emacs/ 
(defun bh-choose-header-mode ()
  "为.h选择是否是objc"
  (interactive)
  (if (string-equal (substring (buffer-file-name) -2) ".h")
      (progn
        ;; OK, we got a .h file, if a .m file exists we'll assume it's
        ; an objective c file. Otherwise, we'll look for a .cpp file.
        (let ((dot-m-file (concat (substring (buffer-file-name) 0 -1) "m"))
              (dot-cpp-file (concat (substring (buffer-file-name) 0 -1) "cpp")))
          (if (file-exists-p dot-m-file)
              (progn
                (objc-mode)
                )
            (if (file-exists-p dot-cpp-file)
                (c++-mode)
              )
            )
          )
        )
    )
  )
(add-hook 'find-file-hook 'bh-choose-header-mode)

;;  不好使 "为.h选择是否是objc" http://bradjensen.net/bardlog/2013/05/17/emacs-and-objective-c/
;; (add-to-list 'magic-mode-alist
;;              `(,(lambda ()
;;                   (and (string= (file-name-extension buffer-file-name) "h")
;;                        (or (re-search-forward "@\\"
;;                                               magic-mode-regexp-match-limit
;;                                               t)
;;                            (re-search-forward "@\\"
;;                                               magic-mode-regexp-match-limit
;;                                               t))))
;;                . objc-mode))
 


(provide 'objc-config)
