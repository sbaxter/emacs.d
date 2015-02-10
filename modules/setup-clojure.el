;;;;
;; Clojure
;;;;

(setq cider-repl-tab-command 'indent-for-tab-command)

;; Enable paredit for Clojure
(add-hook 'clojure-mode-hook 'enable-paredit-mode)

;; A little more syntax highlighting
(require 'clojure-mode-extra-font-locking)

;; Use clojure mode for other extensions
(add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.boot$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs.*$" . clojure-mode))
(add-to-list 'auto-mode-alist '("lein-env" . enh-ruby-mode))

;; syntax hilighting for midje
(add-hook 'clojure-mode-hook
          (lambda ()
            (setq inferior-lisp-program "lein repl")
            (font-lock-add-keywords
             nil
             '(("(\\(facts?\\)"
                (1 font-lock-keyword-face))
               ("(\\(background?\\)"
                (1 font-lock-keyword-face))))
            (define-clojure-indent (fact 1))
            (define-clojure-indent (facts 1))))

;; Midje mode
(add-hook 'clojure-mode-hook 'midje-mode)

;;;;
;; Cider
;;;;

;; provides minibuffer documentation for the code you're typing into the repl
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

;; DO NOT go right to the REPL buffer when it's finished connecting
(setq cider-repl-pop-to-buffer-on-connect nil)

;; Stack traces?
(setq cider-popup-stacktraces nil)
(setq cider-repl-popup-stacktraces t)

;; When there's a cider error, show its buffer and switch to it
(setq cider-show-error-buffer t)
(setq cider-auto-select-error-buffer t)

;; Truncate stuff...
(setq cider-repl-print-length 100)

;; Where to store the cider history.
(setq cider-repl-history-file "~/.emacs.d/cider-history")

;; Wrap when navigating history.
(setq cider-repl-wrap-history t)

;; enable paredit, rainbow delimiters in your REPL
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)

;; Format
(setq cider-repl-use-clojure-font-lock t)
(setq cider-repl-result-prefix ";; => ")


;; rk-annotate
(defvar clojure-keyword-vars
  '("defn$" "defn'" "fna" "fnv" "fn'" "fn$"))

;; Font lock rk-annotate keywords vars
(font-lock-add-keywords 'clojure-mode
                        `((,(concat "(\\(?:\.*/\\)?"
                                    (regexp-opt clojure-keyword-vars t)
                                    "\\>")
                           1 font-lock-keyword-face)))

;; Function name support for defn$
(font-lock-add-keywords 'clojure-mode
                        `((,(concat "(\\(?:[a-z\.-]+/\\)?\\(defn\\$\\)"
                                    ;; Function declarations
                                    "\\>"
                                    ;; Any whitespace
                                    "[ \r\n\t]*"
                                    ;; Possibly type or metadata
                                    "\\(?:#?^\\(?:{[^}]*}\\|\\sw+\\)[ \r\n\t]*\\)*"
                                    "\\(\\sw+\\)?")
                           2 font-lock-function-name-face)))

;; Indentation
(define-clojure-indent
  (fn$ 1)
  (fna 1)
  (fnv 1)
  (fn' 1)
  (valid 1)
  (invalid 1)
  (typecheck 1))
