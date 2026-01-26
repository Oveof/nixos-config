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

(defvar my/j-map (make-sparse-keymap)
  "My custom leader submap for SPC j …")

(map! :leader "j" my/j-map)
(map! :map my/j-map
      :desc "Majutsu Log (Emacs state)" "l" #'my/majutsu-log-emacs-state
      :desc "Justfile tasks"            "f" #'justl)


;; (use-package! justl
;;   :custom
;;   (justl-per-recipe-buffer t)
;;   :config
;;   (map! :n "e" #'justl-exec-vterm))

(map! :leader
      :desc "Fuzzy switch workspace"
      "r" #'+workspace/switch-to)

(use-package! grease
  :commands (grease-open grease-toggle grease-here)
  :init
  (setq grease-sort-method 'type
        grease-show-hidden nil
        grease-preview-window-width 0.4)
  :config
  (map! :leader
        (:prefix ("o g" . "Grease")
         :desc "Toggle Grease"           "g" #'grease-toggle
         :desc "Open Grease (current)"   "o" #'grease-open
         :desc "Open at project root"    "h" #'grease-here)))

;; Silence byte-compiler: tell it this is a special (dynamic) var.
(defvar vterm-buffer-name)

(after! vterm
  (after! justl
    (defun my/justl-vterm-per-recipe (orig-fn &rest args)
      (let* ((recipe (justl--get-recipe-under-cursor))
             (vterm-buffer-name (format "*just-%s*" (justl--recipe-name recipe))))
        (apply orig-fn args)))
    (advice-add #'justl-exec-vterm :around #'my/justl-vterm-per-recipe)))
(after! justl
  (setq justl-shell 'vterm)

  (map! :map justl-mode-map
        :localleader
        :desc "Execute recipe in vterm"
        "x" #'justl-exec-vterm
        :desc "Execute recipe"
        "e" #'justl-exec-recipe
        :desc "Execute default in vterm"
        "d" #'justl-exec-default-recipe))


(use-package! envrc
  :config
  (envrc-global-mode))

(add-hook 'after-save-hook
          (lambda ()
            (when (and (bound-and-true-p envrc-global-mode)
                       buffer-file-name
                       (string-match-p (rx (or ".env" ".envrc") eos) buffer-file-name))
              (envrc-reload))))


;; (use-package! evil-colemak-basics
;;   :after evil
;;   :init
;;   ;; Enable Mod-DH / DHm support (swaps bindings for `m` and `h`)
;;   (setq evil-colemak-basics-layout-mod 'mod-dh)
;;   :config
;;   (global-evil-colemak-basics-mode))

;; (after! evil
;;   ;; Window movement (C-w …)
;;   (map! :map evil-window-map
;;         "m" #'evil-window-left
;;         "n" #'evil-window-down
;;         "e" #'evil-window-up
;;         "i" #'evil-window-right)

;;   ;; Optional: put old hjkl window keys back where they came from
;;   (map! :map evil-window-map
;;         "h" #'evil-window-prev
;;         "j" #'evil-window-next
;;         "k" #'evil-window-up
;;         "l" #'evil-window-right))

;; (after! evil
;;   (map! :map evil-window-map
;;         "M" #'evil-window-decrease-width
;;         "I" #'evil-window-increase-width
;;         "N" #'evil-window-decrease-height
;;         "E" #'evil-window-increase-height))

;; ─────────────────────────────────────────────────────────────
;; Colemak-DH toggleable Evil layer
;; ─────────────────────────────────────────────────────────────

(defvar my/colemak-dh-evil-map (make-sparse-keymap)
  "Keymap enabled when `my/colemak-dh-evil-mode' is active.")

(define-minor-mode my/colemak-dh-evil-mode
  "Toggle Colemak-DH Evil bindings."
  :init-value nil
  :global t
  ;; :keymap my/colemak-dh-evil-map
  :lighter " CDH")   ;; ← mode-line indicator

(after! evil
  ;; -----------------------------------------------------------
  ;; Core movement (Colemak-DH home row)
  ;; -----------------------------------------------------------
  ;; (evil-define-key '(normal visual motion operator)
  ;;     my/colemak-dh-evil-map
  ;;   ;; Movement
  ;;   "m" #'evil-backward-char     ; ←
  ;;   "n" #'evil-next-line         ; ↓
  ;;   "e" #'evil-previous-line     ; ↑
  ;;   "i" #'evil-forward-char      ; →

  ;;   ;; Old m n e i functionality → hjkl
  ;;   "h" #'evil-set-marker        ; old m
  ;;   "j" #'evil-search-next       ; old n
  ;;   "k" #'evil-end-of-word       ; old e
  ;;   "l" #'evil-insert)           ; old i

  ;; -----------------------------------------------------------
  ;; Window movement (C-w …)
  ;; -----------------------------------------------------------
  ;; Reuse evil-window-map under C-w
  (define-key my/colemak-dh-evil-map (kbd "C-w") evil-window-map)

  (map! :map evil-window-map
        "m" #'evil-window-left
        "n" #'evil-window-down
        "e" #'evil-window-up
        "i" #'evil-window-right)

  ;; Optional: window resizing (Shifted)
  (map! :map evil-window-map
        "M" #'evil-window-decrease-width
        "I" #'evil-window-increase-width
        "N" #'evil-window-decrease-height
        "E" #'evil-window-increase-height))

;; ─────────────────────────────────────────────────────────────
;; Leader key toggle
;; ─────────────────────────────────────────────────────────────
(map! :leader
      :desc "Toggle Colemak-DH Evil keys"
      "t C" #'my/colemak-dh-evil-mode)



;; TS/JS buffers
(add-hook 'typescript-mode-hook #'lsp-deferred)
(add-hook 'js-mode-hook #'lsp-deferred)

;; Angular templates are usually web-mode in Doom
(add-hook 'web-mode-hook #'lsp-deferred)


(after! lsp-mode
  (require 'lsp-angular)

  ;; Only treat a buffer as "Angular-project HTML" if we're under a folder
  ;; that contains angular.json (adjust if you use Nx or other layouts).
  (defun my/angular-project-p ()
    (locate-dominating-file default-directory "angular.json"))

  ;; Register an Angular LS client that can attach to web-mode HTML buffers
  ;; *in Angular projects*, without replacing your normal HTML server.
  (lsp-register-client
   (make-lsp-client
    :new-connection
    (lsp-stdio-connection
     (or lsp-clients-angular-language-server-command
         '("ngserver" "--stdio")))
    :activation-fn
    (lambda (filename _mode)
      (and filename
           (string-match-p "\\.html\\'" filename)
           (eq major-mode 'web-mode)
           (my/angular-project-p)))
    :add-on? t
    :server-id 'angular-ls-webmode)))
