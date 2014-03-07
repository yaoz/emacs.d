
;;
;;
;;================================================================================================================================
;;
;;系统剪贴板快捷键（C-z 退出
(global-set-key "\C-z" 'undo)

;;C-Space被输入法占用，改用C-c m来标记文本块
(global-set-key "\C-cm" 'set-mark-command)


;;关闭toolbar  
(tool-bar-mode)  

;;启用ibuffer支持，增强*buffer*
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;;默认进入text-mode，而不是没有什么功能的fundamental-mode
(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;;显示行号
;; (global-linum-mode 1)

;;设置初始目录为rails项目目录
;(setq default-directory "d:\\rails")

;;设定语言环境为utf-8
(setq current-language-environment "UTF-8")
(setq default-input-method "chinese-py")
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)




;;No Visual feedback on selections
(setq-default transient-mark-mode nil)

;; No end a file with a newline
(setq require-final-newline nil)

;; Stop at the end of the file, not just add lines
(setq next-line-add-newlines nil)


;; 我不想听见emacs 一个劲的叫
(setq visible-bell t);
;;在console 下 , 我也不想看到屏幕不停的闪
(setq ring-bell-function (lambda ()  t))
;;我觉得这里的设置对我来说比缺省的设置方便。
;;
;;关闭起动时的那个“开机画面”。
;;
(setq inhibit-startup-message t)
;;显示列号。
;;
(setq column-number-mode t)
;;不要在鼠标点击的那个地方插入剪贴板内容。我不喜欢那样，经常把
;;我的文档搞的一团糟。我觉得先用光标定位，然后鼠标中键点击要好
;;的多。不管你的光标在文档的那个位置，或是在 minibuffer，鼠标
;;中键一点击，X selection 的内容就被插入到那个位置。
;;
;;用一个很大的 kill ring. 这样防止我不小心删掉重要的东西。我很
;;努莽的，你知道 :P
;;
(setq kill-ring-max 200)
;;把 fill-column 设为 60. 这样的文字更好读。
;;
(setq default-fill-column 60)

(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)
;;设置 sentence-end 可以识别中文标点。不用在 fill 时在句号后插
;;入两个空格。
;;
(setq enable-recursive-minibuffers t)
;;可以递归的使用 minibuffer。我经常需要这么做。
;;
;;(setq scroll-step 1
;;     scroll-margin 3
;;    scroll-conservatively 10000)
;;防止页面滚动时跳动， scroll-margin 3 可以在靠近屏幕边沿3行时
;;就开始滚动，可以很好的看到上下文。
;;
(setq default-major-mode 'text-mode)
;;把缺省的 major mode 设置为 text-mode, 而不是几乎什么功能也
;;没有的 fundamental-mode.
;;
(show-paren-mode t)
(setq show-paren-style 'parentheses)
;;括号匹配时显示另外一边的括号，而不是烦人的跳到另一个括号。
;;
(mouse-avoidance-mode 'animate)
;;光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线。
;;
(auto-image-file-mode)
;;让 Emacs 可以直接打开和显示图片。
;;
(global-font-lock-mode t)
;;进行语法加亮。
;;
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'LaTeX-hide-environment 'disabled nil)
;;把这些缺省禁用的功能打开。
;;


(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)
;;让 dired 可以递归的拷贝和删除目录。


;; 没有 toolbar
(setq tool-bar-mode nil);
;; 没有 menubar
(setq menu-bar-mode t);

;; use clipboard
(setq x-select-enable-clipboard t)

;; 在退出 emacs 之前确认是否退出
(setq confirm-kill-emacs 'yes-or-no-p)

;(put 'scroll-left 'disabled nil)
(scroll-bar-mode -1)

(provide 'base-config)
