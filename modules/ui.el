;; Show line numbers
(global-linum-mode)

;; And disable line number mode when linum is active.
(dolist
    (mode-hook
     '(completion-list-mode-hook
       debugger-mode-hook
       cider-repl-mode-hook
       cider-stacktrace-mode-hook
       cider-docview-mode-hook))
  (add-hook mode-hook (lambda () (linum-mode -11))))

;; Turn off hide-show?
(hs-minor-mode -1)

;; disable menu, toolbar, and scrollbar
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))

;; Color Theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/themes")
(load-theme 'homebrew t)

;; No cursor blinking, it's distracting
(blink-cursor-mode 0)

;; no bell
(setq ring-bell-function 'ignore)


;;;;
;; Mode Line
;;;;

;; use setq-default to set it for /all/ modes
(setq-default mode-line-format
  (list
    ;; the buffer name; the file name as a tool tip
    '(:eval (propertize "%b " 'help-echo (buffer-file-name)))

    ;; the current major mode for the buffer.
    "["
    '(:eval (propertize "%m" 'help-echo buffer-file-coding-system))
    "] "

    ;; column, '%02' to set to 2 chars at least; prevents flickering
    (propertize "%02c")

    ;; insert vs overwrite mode, input-method in a tooltip
    '(:eval (propertize (if overwrite-mode "Ovr" "")
              'face 'font-lock-preprocessor-face
              'help-echo (concat "Buffer is in "
                           (if overwrite-mode "overwrite" "insert") " mode")))

    ;; was this buffer modified since the last save?
    '(:eval (when (buffer-modified-p)
              (concat " "  (propertize "!"
                             'face 'font-lock-warning-face
                             'help-echo "Buffer has been modified"))))

    ;; is this buffer read-only?
    '(:eval (when buffer-read-only
              (concat " "  (propertize "RO"
                             'face 'font-lock-type-face
                             'help-echo "Buffer is read-only"))))
    " "
    "%-" ;; fill with '-'
    ))
