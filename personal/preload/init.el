;; Make org-agenda accessible:
(global-set-key "\C-ca" 'org-agenda)

(require 'paredit)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojurescript-mode-hook 'paredit-mode)

(require 'rainbow-delimiters)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojurescript-mode-hook 'rainbow-delimiters-mode)
