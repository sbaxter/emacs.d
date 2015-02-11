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

;; Explicitly set coding priority
(set-language-environment "UTF-8")
(set-keyboard-coding-system nil)

;; Seed the random-number generator
(random t)

;; Meta key
(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'control))

;; Edit compressed files.
(auto-compression-mode t)

;; Disable recentf
(setq recentf-save-file "~/.emacs.d/.recentf")
(setq recentf-max-saved-items 5)
(recentf-mode -1)

;; set text-mode as the default major mode, instead of fundamental-mode
;; The first of the two lines in parentheses tells Emacs to turn on Text mode
;; when you find a file, unless that file should go into some other mode, such
;; as C mode.
(setq-default major-mode 'text-mode)
