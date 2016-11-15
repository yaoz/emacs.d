(require 'projectile)
(setq projectile-known-projects-file "~/.emacs.d/.projectile-bookmarks.eld.emacs")
;; (setq projectile-cache-file "~/.projectile.cache.emacs")
(setq projectile-use-native-indexing t)
(setq projectile-enable-caching t)
(setq projectile-show-paths-function 'projectile-hashify-with-relative-paths) 
(setq projectile-indexing-method 'native)
(projectile-global-mode)
(setq projectile-completion-system 'ido)
;; (setq projectile-completion-system 'grizzl)

(require 'helm-projectile)
(helm-projectile-on)


(provide 'prj-config)
