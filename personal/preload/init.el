(require 'rainbow-delimiters)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojurescript-mode-hook 'rainbow-delimiters-mode)

(add-hook 'clojure-mode-hook 'turn-on-smartparens-strict-mode)
(add-hook 'clojurescript-mode-hook 'turn-on-smartparens-strict-mode)

;; Commander when switching projects:
(require 'projectile)
(setq projectile-switch-project-action 'projectile-commander)
(def-projectile-commander-method ?\C-?
  "Go back to project selection."
  (projectile-switch-project))
