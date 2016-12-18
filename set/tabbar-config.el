;; {{{ tabbar
(require 'tabbar)
(set-face-attribute
 'tabbar-default nil
 :background "gray20"
 :foreground "gray20"
 :box '(:line-width 1 :color "gray20" :style nil))
(set-face-attribute
 'tabbar-unselected nil
 :background "gray30"
 :foreground "white"
 :box '(:line-width 5 :color "gray30" :style nil))
(set-face-attribute
 'tabbar-selected nil
 :background "gray75"
 :foreground "black"
 :box '(:line-width 5 :color "gray75" :style nil))
(set-face-attribute
 'tabbar-highlight nil
 :background "white"
 :foreground "black"
 :underline nil
 :box '(:line-width 5 :color "white" :style nil))
(set-face-attribute
 'tabbar-button nil
 :box '(:line-width 1 :color "gray20" :style nil))
(set-face-attribute
 'tabbar-separator nil
 :background "gray20"
 :height 0.6)
 
;; Change padding of the tabs
;; we also need to set separator to avoid overlapping tabs by highlighted tabs
(custom-set-variables
 '(tabbar-separator (quote (0.5))))
;; adding spaces
(defun tabbar-buffer-tab-label (tab)
  "Return a label for TAB.
That is, a string used to represent it on the tab bar."
  (let ((label  (if tabbar--buffer-show-groups
                    (format "[%s]  " (tabbar-tab-tabset tab))
                  (format "%s  " (tabbar-tab-value tab)))))
    ;; Unless the tab bar auto scrolls to keep the selected tab
    ;; visible, shorten the tab label to keep as many tabs as possible
    ;; in the visible area of the tab bar.
    (if tabbar-auto-scroll-flag
        label
      (tabbar-shorten
       label (max 1 (/ (window-width)
                       (length (tabbar-view
                                (tabbar-current-tabset)))))))))
(tabbar-mode 1)


(global-set-key [(control next)] 'tabbar-forward-tab)
(global-set-key [(control prior)] 'tabbar-backward-tab)
;;}}}
;;按名称排序加入tab
 (defun tabbar-add-tab (tabset object &optional append_ignored)
  (let ((tabs (tabbar-tabs tabset)))
    (if (tabbar-get-tab object tabset)
        tabs
      (let ((tab (tabbar-make-tab object tabset)))
        (tabbar-set-template tabset nil)
        (set tabset (sort (cons tab tabs)
                          (lambda (a b) (string< (buffer-name (car a)) (buffer-name (car b))))))))))


 (defun tabbar-buffer-groups ()
   "Return the list of group names the current buffer belongs to.
     Return a list of one element based on major mode."
   (list
    (cond
     ((or (get-buffer-process (current-buffer))
          ;; Check if the major mode derives from `comint-mode' or
          ;; `compilation-mode'.
          (tabbar-buffer-mode-derived-p
           major-mode '(comint-mode compilation-mode)))
      "Process"
      )
     ((and (string-equal "*" (substring (buffer-name) 0 1)) (string-equal "*nrepl*" (buffer-name)))
      "Common"
      )
     ((member (buffer-name)
              '("dao.org" "ji.org" "zefa.org" "mie.org" "ku.org" "jin.org" "bei.org" "o.org" "zh.org" "xyb.org" "ch.org" "xin.org" "youxi.org" "se.org"))
      "Main"
      )
     ((eq major-mode 'dired-mode)
      "Dired"
      )
     ((memq major-mode
            '(help-mode apropos-mode Info-mode Man-mode))
      "Common"
      )
     ((memq major-mode
            '(rmail-mode
              rmail-edit-mode vm-summary-mode vm-mode mail-mode
              mh-letter-mode mh-show-mode mh-folder-mode
              gnus-summary-mode message-mode gnus-group-mode
              gnus-article-mode score-mode gnus-browse-killed-mode))
      "Mail"
      )
     ((memq major-mode
            '(php-mode nginx-mode magit-diff-mode ))
      "php"
      )

     ((memq major-mode
     		 '(python-mode))
      "python"
      )
     
     ((memq major-mode
	    '(ruby-mode rails-mode coffee-mode web-mode js-mode css-mode yaml-mode scss-mode sass-mode feature-mode))
      "ruby"
      )
     ((memq major-mode
            '(java-mode nxml-mode))
      "Web"
      )
     ((memq major-mode
            '(org-mode graphviz-dot-mode))
      "Org"
      )
     ((memq major-mode
            '(objc-mode ob))
      "Objc"
      )
     (t
      ;; Return `mode-name' if not blank, `major-mode' otherwise.
      (if (and (stringp mode-name)
               ;; Take care of preserving the match-data because this
               ;; function is called when updating the header line.
               (save-match-data (string-match "[^ ]" mode-name)))
          mode-name
        (symbol-name major-mode))
      ))))

(provide 'tabbar-config)
