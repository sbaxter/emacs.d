;;;;
;; Packages
;;;;

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)

(setq-default package-check-signature nil)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(paredit
    clojure-mode
    clojure-mode-extra-font-locking
    markdown-mode
    cider
    ido-completing-read+
    smex
    rainbow-delimiters
    evil
    evil-leader
    key-chord))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;;;;
;; Customization
;;;;

(add-to-list 'load-path "~/.emacs.d/modules")

(load "navigation.el")
(load "ui.el")
(load "editing.el")
(load "clojure-setup.el")
(load "markdown-setup.el")
(load "evil-setup.el")
(load "misc.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (cider smex sesman rainbow-delimiters paredit markdown-mode key-chord ido-completing-read+ evil-leader clojure-mode-extra-font-locking))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
