;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!
;
;; Theme options for doom-gruvbox-light
(setq
 ;; brighter mode-line?
 doom-gruvbox-light-brighter-modeline t

 ;; brighter comments?
 doom-gruvbox-light-brighter-comments nil

 ;; comment background
 doom-gruvbox-light-comment-bg nil

 ;; padded modeline: t for default (4px), number for exact px
 doom-gruvbox-light-padded-modeline 4

 ;; contrast variant
 doom-gruvbox-light-variant "soft")

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-gruvbox-light)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; (use-package! justl
;;   :config
;;   (map! :n "e" 'justl-exec-recipe))
;;

;; disable system clipboard insta sync
(setq select-enable-clipboard nil
      select-enable-primary nil)

;; Unbind Doom's default `gr` (quickrn)
(map! :n "gr" nil)

(map! :after lsp-mode
      :map lsp-mode-map
      :n "gr" #'lsp-find-references
      :n "gi" #'lsp-find-implementation)

(after! treesit
  (add-to-list 'treesit-language-source-alist
               '(c-sharp "https://github.com/tree-sitter/tree-sitter-c-sharp")))

(after! treesit
  (setq treesit-font-lock-level 4))

(add-hook 'csharp-ts-mode-hook
          (lambda ()
            (setq-local treesit-font-lock-level 4)
            (font-lock-flush)
            (font-lock-ensure)))



;; Angular templates: use web-mode
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))

;; TypeScript
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))

;; Optional: Angular component templates sometimes benefit from slightly tweaked web-mode settings
(after! web-mode
  (setq web-mode-markup-indent-offset 2
        web-mode-code-indent-offset 2
        web-mode-css-indent-offset 2))

(use-package jj-mode
  :commands (jj-log))

;; Ensure LSP starts for relevant buffers
(add-hook 'web-mode-hook #'lsp-deferred)
(add-hook 'typescript-mode-hook #'lsp-deferred)
(after! lsp-mode
  (require 'lsp-angular)
  (setq lsp-angular-server-command
        (list (executable-find "ngserver") "--stdio")))

;; TODO states
(setq org-todo-keywords
      '((sequence "TODO(t)" "PLANNING(p)" "IN-PROGRESS(i@/!)" "VERIFYING(v!)" "BLOCKED(b@)"  "|" "DONE(d!)" "OBE(o@!)" "WONT-DO(w@/!)" )
        ))

(defun my/majutsu-log-emacs-state ()
  "Open the Majutsu log and immediately switch to Emacs state."
  (interactive)
  (majutsu-log)
  ;; Wait a moment for the buffer to open, then switch to emacs state
  (run-at-time
   0.05 nil
   (lambda ()
     (when (derived-mode-p 'majutsu-log-mode)
       (evil-emacs-state)))))

(map! :leader
      :desc "Majutsu Log (Emacs state)"
      "j" #'my/majutsu-log-emacs-state)
