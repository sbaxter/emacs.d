;; Customizations relating to editing a buffer.

;; no backup files
(setq-default make-backup-files nil)

;; no autosave files
(setq-default auto-save-default nil)

;; yay rainbows!
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Highlights matching parenthesis
(show-paren-mode 1)
(setq show-paren-delay 0)
(set-face-background 'show-paren-match "#00FFFF")
(set-face-foreground 'show-paren-match nil)
(set-face-attribute 'show-paren-match nil)
(set-face-background 'show-paren-mismatch "#FF0000")
(set-face-foreground 'show-paren-mismatch "#FFFFFF")
(set-face-attribute 'show-paren-mismatch nil :weight 'extra-bold)

;; Don't use hard tabs
(setq-default indent-tabs-mode nil)

;; use 2 spaces for tabs
(setq-default tab-width 2)
(setq-default evil-shift-width 2)

;; add no new lines when "arrow-down key" at the end of a buffer
(setq-default next-line-add-newlines nil)

;; remove trailing whitespaces before save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; enable to support navigate in camelCase words
(global-subword-mode t)

;; No electric indent.
(setq-default electric-indent-mode nil)

;; paredit in programming mode
(add-hook 'prog-mode-hook 'enable-paredit-mode)

;; turn off auto-fill mode
(auto-fill-mode -1)
