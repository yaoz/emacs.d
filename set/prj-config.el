(add-to-list 'load-path "~/.emacs.d/el-get/dash/")
(add-to-list 'load-path "~/.emacs.d/el-get/epl/")
(add-to-list 'load-path "~/.emacs.d/el-get/projectile/")


(require 'projectile)
(setq projectile-known-projects-file "~/.projectile-bookmarks.eld.emacs")
;; (setq projectile-cache-file "~/.projectile.cache.emacs")
(setq projectile-use-native-indexing t)
(setq projectile-enable-caching t)
(setq projectile-show-paths-function 'projectile-hashify-with-relative-paths) 
(setq projectile-indexing-method 'native)
(projectile-global-mode)
(setq projectile-completion-system 'ido)
;; (setq projectile-completion-system 'grizzl)


(provide 'prj-config)
