;; evil all the times
(evil-mode 1)

;; Not sure exactly...
(setq evil-auto-indent t)
(setq evil-regexp-search t)
(setq evil-want-C-i-jump t)
(setq-default evil-ex-previous-command nil)

;; change mode-line color by evil state
(lexical-let ((default-color (cons (face-background 'mode-line)
                                  (face-foreground 'mode-line))))
 (add-hook 'post-command-hook
   (lambda ()
     (let ((color (cond ((minibufferp) default-color)
                        ((evil-insert-state-p) '("#005500" . "#000000"))
                        ((evil-emacs-state-p)  '("#990099" . "#ffffff"))
                        ((buffer-modified-p)   '("#000000" . "#00FF00"))
                        (t default-color))))
       (set-face-background 'mode-line (car color))
       (set-face-foreground 'mode-line (cdr color))))))

;; Map jk -> ESC
(require 'key-chord)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-define evil-replace-state-map "jk" 'evil-normal-state)

;;; esc quits
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

;; evil-leader all the times.
(global-evil-leader-mode)

;; leader key
(evil-leader/set-leader ",")

;; leader commands
(evil-leader/set-key
  "w"     'paredit-wrap-round
  "<RET>" 'paredit-close-round-and-newline
  "h"     'paredit-backward-slurp-sexp
  "j"     'paredit-backward-barf-sexp
  "k"     'paredit-forward-barf-sexp
  "l"     'paredit-forward-slurp-sexp
  "S"     'paredit-split-sexp
  "s"     'paredit-splice-sexp
  "x"     'paredit-kill)

;; Doing this to override the stupid default command.
(evil-define-command evil-ex (&optional initial-input)
  "Enter an Ex command.
The ex command line is initialized with the value of
INITIAL-INPUT. If the command is called interactively the initial
input depends on the current state. If the current state is
normal state and no count argument is given then the initial
input is empty. If a prefix count is given the initial input is
.,.+count. If the current state is visual state then the initial
input is the visual region '<,'> or `<,`>. If the value of the
global variable `evil-ex-initial-input' is non-nil, its content
is appended to the line."
  :keep-visual t
  :repeat abort
  (interactive
   (list
    (let ((s (concat
              (cond
               ((and (evil-visual-state-p)
                     evil-ex-visual-char-range
                     (memq (evil-visual-type) '(inclusive exclusive)))
                "`<,`>")
               ((evil-visual-state-p)
                "'<,'>")
               (current-prefix-arg
                (let ((arg (prefix-numeric-value current-prefix-arg)))
                  (cond ((< arg 0) (setq arg (1+ arg)))
                        ((> arg 0) (setq arg (1- arg))))
                  (if (= arg 0) '(".")
                    (format ".,.%+d" arg)))))
              evil-ex-initial-input)))
      (and (> (length s) 0) s))))
  (let ((evil-ex-current-buffer (current-buffer))
        (evil-ex-previous-command (unless initial-input
                                    (car-safe evil-ex-history)))
        evil-ex-argument-handler
        evil-ex-info-string
        result)
    (minibuffer-with-setup-hook
        #'evil-ex-setup
      (setq result
            (read-from-minibuffer
             ":"
             (or initial-input nil)
             evil-ex-completion-map
             nil
             'evil-ex-history
             evil-ex-previous-command
             t)))
    (evil-ex-execute result)))
