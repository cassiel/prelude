(require 'paredit)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojurescript-mode-hook 'paredit-mode)

(require 'rainbow-delimiters)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojurescript-mode-hook 'rainbow-delimiters-mode)

;; Commander when switching projects:
(require 'projectile)
(setq projectile-switch-project-action 'projectile-commander)
(def-projectile-commander-method ?\C-?
  "Go back to project selection."
  (projectile-switch-project))

;; Personal shortcuts:
(global-set-key "\C-ca" 'org-agenda)

(global-set-key "\C-o" 'avy-goto-char)
(global-set-key "\M-g\M-w" 'avy-goto-word-1)
(global-set-key "\M-g\M-l" 'avy-goto-line)
