;; Add MELPA Stable to package archives (deferred until package.el loads)
(with-eval-after-load 'package
  (add-to-list 'package-archives
               '("melpa-stable" . "https://stable.melpa.org/packages/") t))
