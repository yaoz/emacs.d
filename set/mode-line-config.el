
(display-time-mode t)
(setq display-time-day-and-date t)
(setq display-time-format "%H:%M %m/%d %a")
(setq display-time-interval 10)

(set-face-foreground 'mode-line "white")
(set-face-background 'mode-line "purple")
(set-face-background 'mode-line-inactive "light blue")

(setq default-mode-line-format
       (list "-"
        'mode-line-mule-info
        'mode-line-modified
        ;; 'mode-line-frame-identification
        "[%b]"
        ;; (getenv "HOST")
        ":["
        '(line-number-mode "%l")
	"/"
        '(-3 "%p")			;百分比
        "] ["
        'global-mode-string
        "] ["
	'default-directory ;目录
	"]   %[("
        ;; '(:eval (mode-line-mode-name))
	'mode-name			;主要mode名
        'mode-line-process		
        'minor-mode-alist		;次要
        "%n"
        ")%]--"
        '(which-func-mode ("" which-func-format "--"))
        "[" '(column-number-mode "C%c") "]"
	))

(provide 'mode-line-config)
