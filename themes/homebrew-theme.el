;; ---------------------------
;;
;; Homebrew : A color theme
;;
;; ----------------------------

(deftheme homebrew "A dark color theme for Emacs based on Homebrew for terminal")

(custom-theme-set-variables
  'homebrew
  '(linum-format "%4i "))

(let (
      (*white*        "#FFFFFF")
      (*magenta*      "#CC00CC")
      (*dark-magenta* "#990099")
      (*light-green*  "#00FF00")
      (*green*        "#00CC00")
      (*dark-green*   "#009900")
      (*red*          "#CC0000")
      (*dark-red*     "#990000")
      (*black*        "#000000")
      (*blue*         "#0000FF")
      (*dark-blue*    "#000099")
      (*orange*       "#EE9900")
      (*cyan*         "#00CCCC")
      (*dark-cyan*    "#339999")
      (*yellow*       "#CCCC00")
      (*dark-yellow*  "#999900")
      (*gray*         "#666666")
      (*dark-gray*    "#151515")
      (*light-gray*   "#666666"))

  (let (
        (*background*         *black*)
        (*comments*           *blue*)
        (*constant*           *cyan*)
        (*current-line*       *dark-gray*)
        (*cursor-underscore*  *yellow*) ;; #EEDC82
        (*keywords*           *magenta*)

        ;; Sidebar line numbers
        (*line-number*        *black*)
        (*line-fg*            *orange*)

        (*type-face*          *green*) 
        (*method-declaration* *light-green*)

        (*mode-line-bg*       *black*)
        (*mode-inactive-bg*   *black*)
        (*mode-line-fg*       *dark-green*)
        (*mode-inactive-fg*   *gray*)

        (*normal*             *green*)
        (*number*             *red*)
        (*operators*          *light-green*)
        (*warning*            *magenta*)
        (*regexp*             *red*)
        (*string*             *red*)
        (*variable*           *light-green*)
        (*visual-selection*   *gray*))

    (custom-theme-set-faces
      'homebrew

      `(bold ((t (:bold t))))
      `(button ((t (:foreground, *keywords* :underline t))))
      `(default ((t (:background, *background* :foreground, *normal*))))
      `(header-line ((t (:background, *mode-line-bg* :foreground, *normal*)))) ;; info header
      `(highlight ((t (:background, *current-line*))))
      `(highlight-face ((t (:background, *current-line*))))
      `(hl-line ((t (:background, *current-line* :underline t))))
      `(info-xref ((t (:foreground, *keywords* :underline t))))
      `(region ((t (:background, *visual-selection*))))
      `(underline ((nil (:underline t))))

      ;; font-lock
      `(font-lock-builtin-face ((t (:foreground, *operators*))))
      `(font-lock-comment-delimiter-face ((t (:foreground, *comments*))))
      `(font-lock-comment-face ((t (:foreground, *comments*))))
      `(font-lock-constant-face ((t (:foreground, *constant*))))
      `(font-lock-doc-face ((t (:foreground, *string*))))
      `(font-lock-doc-string-face ((t (:foreground, *string*))))
      `(font-lock-function-name-face ((t (:foreground, *method-declaration*))))
      `(font-lock-keyword-face ((t (:foreground, *keywords*))))
      `(font-lock-negation-char-face ((t (:foreground, *warning*))))
      `(font-lock-number-face ((t (:foreground, *number*))))
      `(font-lock-preprocessor-face ((t (:foreground, *keywords*))))
      `(font-lock-reference-face ((t (:foreground, *constant*))))
      `(font-lock-regexp-grouping-backslash ((t (:foreground, *regexp*))))
      `(font-lock-regexp-grouping-construct ((t (:foreground, *regexp*))))
      `(font-lock-string-face ((t (:foreground, *string*))))
      `(font-lock-type-face ((t (:foreground, *type-face*))))
      `(font-lock-variable-name-face ((t (:foreground, *variable*))))
      `(font-lock-warning-face ((t (:foreground, *warning*))))

      ;; GUI
      `(fringe ((t (:background, *background*))))
      `(linum ((t (:background, *line-number* :foreground, *line-fg*))))
      `(minibuffer-prompt ((t (:foreground, *variable*))))
      `(mode-line ((t (:background, *mode-line-bg* :foreground, *mode-line-fg*))))
      `(mode-line-inactive ((t (:background, *mode-inactive-bg* :foreground, *mode-inactive-fg*))))
      `(cursor ((t (:background, *cursor-underscore*))))
      `(text-cursor ((t (:background, *cursor-underscore*))))
      `(vertical-border ((t (:foreground, *background*)))) ;; between splits

      ;; show-paren
      `(show-paren-mismatch ((t (:background, *warning* :foreground, *normal* :weight bold))))
      `(show-paren-match ((t (:background, *keywords* :foreground, *normal* :weight bold))))

      ;; search
      `(isearch ((t (:background, *regexp* :foreground, *visual-selection*))))
      `(isearch-fail ((t (:background, *warning*))))
      `(lazy-highlight ((t (:background, *operators* :foreground, *visual-selection*))))

      ;; rainbow-delimiters
      `(rainbow-delimiters-depth-1-face ((t (:foreground , *magenta*))))
      `(rainbow-delimiters-depth-2-face ((t (:foreground , *yellow*))))
      `(rainbow-delimiters-depth-3-face ((t (:foreground , *white*))))
      `(rainbow-delimiters-depth-4-face ((t (:foreground , *red*))))
      `(rainbow-delimiters-depth-5-face ((t (:foreground , *cyan*))))
      `(rainbow-delimiters-depth-6-face ((t (:foreground , *orange*))))
      `(rainbow-delimiters-depth-7-face ((t (:foreground , *gray*))))
      `(rainbow-delimiters-depth-8-face ((t (:foreground , *green*))))
      `(rainbow-delimiters-depth-9-face ((t (:foreground , *light-gray*))))
      `(rainbow-delimiters-depth-10-face ((t (:foreground , *magenta*))))
      `(rainbow-delimiters-depth-11-face ((t (:foreground , *yellow*))))
      `(rainbow-delimiters-depth-12-face ((t (:foreground , *white*))))

    )))

(provide-theme 'homebrew)
