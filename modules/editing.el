;; Customizations relating to editing a buffer.

;; no backup files
(setq-default make-backup-files nil)

;; no autosave files
(setq-default auto-save-default nil)

;; yay rainbows!
(global-rainbow-delimiters-mode t)

;; Highlights matching parenthesis
(show-paren-mode 1)

;; Don't use hard tabs
(setq-default indent-tabs-mode nil)

;; use 2 spaces for tabs
(setq-default tab-width 2)
(defun die-tabs ()
	(interactive)
	(set-variable 'tab-width 2)
	(mark-whole-buffer)
	(untabify (region-beginning) (region-end))
	(keyboard-quit))
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
