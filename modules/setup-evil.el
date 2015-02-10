;; evil all the times
(evil-mode 1)

;; Not sure exactly...
(setq evil-auto-indent t)
(setq evil-regexp-search t)
(setq evil-want-C-i-jump t)

;; change mode-line color by evil state
(lexical-let ((default-color (cons (face-background 'mode-line)
                                  (face-foreground 'mode-line))))
 (add-hook 'post-command-hook
   (lambda ()
     (let ((color (cond ((minibufferp) default-color)
                        ((evil-insert-state-p) '("#009900" . "#000000"))
                        ((evil-emacs-state-p)  '("#990099" . "#ffffff"))
                        ((buffer-modified-p)   '("#000000" . "#00FF00"))
                        (t default-color))))
       (set-face-background 'mode-line (car color))
       (set-face-foreground 'mode-line (cdr color))))))

;; Map `jj` to enter command-mode.
(evil-define-command cofi/maybe-exit ()
  :repeat change
  (interactive)
  (let ((modified (buffer-modified-p)))
    (insert "j")
    (let ((evt (read-event (format "Insert %c to exit insert state" ?j)
               nil 0.5)))
      (cond
       ((null evt) (message ""))
       ((and (integerp evt) (char-equal evt ?j))
    (delete-char -1)
    (set-buffer-modified-p modified)
    (push 'escape unread-command-events))
       (t (setq unread-command-events (append unread-command-events
                          (list evt))))))))

(define-key evil-insert-state-map "j" #'cofi/maybe-exit)
(define-key evil-replace-state-map "j" #'cofi/maybe-exit)

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
