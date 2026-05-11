;; Rainbow delimiters for Clojure
(with-eval-after-load 'rainbow-delimiters
  (add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'clojurescript-mode-hook 'rainbow-delimiters-mode))

;; Strict smartparens for Clojure
(add-hook 'clojure-mode-hook 'turn-on-smartparens-strict-mode)
(add-hook 'clojurescript-mode-hook 'turn-on-smartparens-strict-mode)

;; Commander when switching projects
(with-eval-after-load 'projectile
  (setq projectile-switch-project-action 'projectile-commander)
  (def-projectile-commander-method ?\C-?
    "Go back to project selection."
    (projectile-switch-project)))

;; Replace shift/nudge key shortcuts in org-mode
(add-hook 'org-mode-hook
          (lambda ()
            (local-set-key (kbd "A-<left>") 'org-shiftleft)
            (local-set-key (kbd "A-<right>") 'org-shiftright)
            (local-set-key (kbd "A-<up>") 'org-shiftup)
            (local-set-key (kbd "A-<down>") 'org-shiftdown)))
