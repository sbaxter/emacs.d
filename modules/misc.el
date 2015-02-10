;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; shell scripts
(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)

;; No need for ~ files when editing
(setq create-lockfiles nil)

;; Go straight to scratch buffer on startup
(setq inhibit-startup-message t)

;; No welcome message.
(eval-after-load "startup"
  '(fset 'display-startup-echo-area-message (lambda ())))

;; Enter debug for startup errors.
(setq debug-on-error t)

(set-language-environment "UTF-8")

;; Seed the random-number generator
(random t)

;; Meta key
(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'control))

;; Auto-fill
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'prog-mode-hook 'turn-on-auto-fill)

;; Edit compressed files.
(auto-compression-mode t)

;; Disable recentf
(setq recentf-save-file "~/.emacs.d/.recentf")
(setq recentf-max-saved-items 5)
(recentf-mode -1)
