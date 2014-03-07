;(setq hs-allow-nesting t)

;hs-hide-block
;hs-show-block
;hs-toggle-hiding
;hs-hide-all
;hs-show-all
(global-set-key (kbd "C-/") 'hs-toggle-hiding)

(global-set-key (kbd "C-c -") 'hs-hide-all)
(global-set-key (kbd "C-c =") 'hs-show-all)

(add-hook 'clojure-mode-hook         'hs-minor-mode)

;;=====================================================================================

(provide 'fold-set)
