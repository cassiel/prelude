# Prelude Local Maintenance Notes

## 2026-05-11: Upgrade to Prelude 2.x

Pulled upstream changes covering Prelude 2.0.0, 2.1.0, and unreleased into
`cassiel-custom`. Summary of local configuration changes made:

### Deprecated packages removed from `custom.el`

The following were removed from `package-selected-packages`:

- `nlinum` — replaced by built-in `display-line-numbers-mode`
- `anzu` — replaced by built-in `isearch-lazy-count`
- `epl` — replaced by built-in `package-upgrade-all`
- `js2-mode` — replaced by built-in `js-ts-mode` (tree-sitter)
- `lsp-mode`, `lsp-ui` — default LSP client is now Eglot (built-in)

To restore lsp-mode support, add the packages back and set
`(setq prelude-lsp-client 'lsp-mode)` in `personal/preload/init.el`.

### Preload file fixed (`personal/preload/init.el`)

The preload file runs before `package.el` initialises, so `package-archives`
and installed packages are not yet available. The file was split:

- **`personal/preload/init.el`** — only contains the MELPA Stable archive
  addition, wrapped in `(with-eval-after-load 'package ...)`.
- **`personal/cassiel.el`** — post-load file containing rainbow-delimiters
  hooks, smartparens-strict hooks, projectile commander config, and org-mode
  keybindings. Uses `with-eval-after-load` where needed.

### Manual `compat` 31 installation

`elpa.gnu.org` was unreachable (connection timeout), preventing installation of
`compat` version 31 which is required by `marginalia` and other packages.

Workaround steps:

```sh
# 1. Clone compat from GitHub
git clone --depth 1 https://github.com/emacs-compat/compat.git /tmp/compat-src

# 2. Create package directory in Prelude's elpa
mkdir -p elpa/compat-31.0.0.1

# 3. Copy source files
cp /tmp/compat-src/compat*.el elpa/compat-31.0.0.1/

# 4. Create package descriptor
cat > elpa/compat-31.0.0.1/compat-pkg.el << 'EOF'
(define-package "compat" "31.0.0.1"
  "Emacs Lisp Compatibility Library"
  '((emacs "25.1"))
  :url "https://github.com/emacs-compat/compat")
EOF

# 5. Generate autoloads
emacs --batch --eval '
  (progn
    (setq package-user-dir (expand-file-name "elpa" default-directory))
    (package-initialize)
    (package-generate-autoloads "compat"
      (expand-file-name "elpa/compat-31.0.0.1")))'

# 6. Remove old version if present
rm -rf elpa/compat-30.1.0.1

# 7. Clean up
rm -rf /tmp/compat-src
```

Once `elpa.gnu.org` is reachable again, this manual install can be replaced by
running `M-x package-upgrade RET compat RET` in Emacs.

### Modules file

No personal `prelude-modules.el` exists yet — Prelude falls back to
`sample/prelude-modules.el`. To customise which modules load (e.g. enable
Clojure), copy it:

```sh
cp sample/prelude-modules.el personal/prelude-modules.el
```
