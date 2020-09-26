(require 'paredit)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojurescript-mode-hook 'paredit-mode)

(require 'rainbow-delimiters)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojurescript-mode-hook 'rainbow-delimiters-mode)

; Personal shortcuts:
(global-set-key "\C-ca" 'org-agenda)

(global-set-key "\C-o" 'avy-goto-char)
(global-set-key "\M-g\M-w" 'avy-goto-word-1)
(global-set-key "\M-g\M-l" 'avy-goto-line)
