;; 设置字体 英文好看 WenQuanyi Micro Hei Mono 文泉驿等宽微米黑 DejaVu Sans Mono-16 (set-frame-font "") WenQuanYi Zen Hei Mono
(defun font-set (english chinese english-size chinese-size)
  (set-face-attribute 'default nil :font
                      (format "%s:pixelsize=%d"  english english-size))
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font) charset
                      (font-spec :family chinese :size chinese-size)))
  )

(defun my-font-set ()
  (font-set "WenQuanYi Zen Hei Mono" "WenQuanYi Zen Hei Mono" 18 18))

(if (and (fboundp 'daemonp) (daemonp))
    (add-hook 'after-make-frame-functions
 	      (lambda (frame)
 		(with-selected-frame frame
 		  (my-font-set))))
  (my-font-set))

(provide 'font-config)
