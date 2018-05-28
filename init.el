;;; package --- Summary

;;; Commentary:

;;; Code:

;;; ------------------------------------------------------------ CUSTOM FILE --
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file t)

;;; --------------------------------------------------------------- PACKAGES --
(require 'package) ;; Start of Package

;; Package Sources
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(setq package-enable-at-startup nil) ;; Avoid initialize twice

(package-initialize) ;; Initialize package

(defvar umkm/package-refresh-p nil) ;; Flag to avoid multiple refresh package

;; Refresh package if first time run
(unless (file-exists-p package-user-dir)
  (package-refresh-contents)
  (setq umkm/package-refresh-p t))

;; Ensure package is installed
(defun umkm/ensure-packages (&rest packages)
  "Ensure PACKAGES is installed. If not, it's will auto install for it."
  (mapcar (lambda (package)
	    (unless (package-installed-p package)
	      (unless umkm/package-refresh-p
		(package-refresh-contents)
		(setq umkm/package-refresh-p t))
	      (package-install package)))
	  packages))


;; ----------------
;; Install Packages
;; ----------------
(umkm/ensure-packages
 ;; ------------
 ;; Dependencies
 ;; ------------
 'pos-tip ;; Tooltip
 'flx ;; Fuzzy
 'smex ;; Recent
 'popup ;; Popup
 ;; -----
 ;; Theme
 ;; -----
 'cyberpunk-theme ;; Color Scheme
 'powerline ;; Power line
 'centered-cursor-mode ;; Always Vertical Centered current line
 'rainbow-delimiters ;; Highlight delimiters.
 'diff-hl ;; Highlight Diff
 'mic-paren ;; Highlight paren
 ;; ----
 ;; Misc
 ;; ----
 'restart-emacs ;; Restart emacs simplify
 'diminish ;; Disable minor mode symbol
 ;; --------
 ;; Key Bind
 ;; --------
 'use-package ;; Provide bind-key*
 ;; -----------
 ;; Programming
 ;; -----------
 'company ;; Auto Complete Engine
 'company-quickhelp ;; Help for complete
 'yasnippet ;; Snippet Engine
 'flycheck ;; Lint
 'flycheck-pos-tip ;; Lint on tooltip
 'lsp-mode ;; Language Service Protocol
 'lsp-ui ;; LSP User Interface
 'company-lsp ;; LSP backend for Company
 ;; ---
 ;; Ivy
 ;; ---
 'ivy ;; Ivy
 'counsel ;; Extension
 'swiper ;; Search
 ;; ---------------
 ;; Text Operations
 ;; ---------------
 'whole-line-or-region ;; Auto line operation when not region
 'move-text ;; Move text up/down
 'undo-tree ;; Undo/Redo
 'anzu ;; Replace with Regexp
 'expand-region ;; Expand Selection
 'hungry-delete ;; Hungry delete
 'mwim ;; Advanced move to begin/end
 'whitespace-cleanup-mode ;; Remove white space

 ;; -------
 ;; Project
 ;; -------
 'projectile ;; Project
 'counsel-projectile ;; Counsel binding for Projectile

 ;; ----
 ;; File
 ;; ----
 'neotree ;; File Manager

 ;; ---------------
 ;; Language: Elisp
 ;; ---------------
 'srefactor ;; Format
 'lisp-extra-font-lock ;; Font-Lock

 ;; ---------------
 ;; Language: CMake
 ;; ---------------
 'cmake-mode ;; CMake Mode
 'cmake-font-lock ;; Font-lock

 ;; ---------------
 ;; Language: C/C++
 ;; ---------------
 'clang-format ;; Format
 'cquery ;; LSP
 'preproc-font-lock ;; preprocess font lock


 ;; -------
 ;; Archive
 ;; -------
 ;;'smartparens	       ;; Parens opreation
 ;; 'iedit		       ;; Ctrl-D
 ;; 'aggressive-indent    ;; Auto Indent
 ;;'volatile-highlights ;; Highlight volatile
 ;; 'yafolding	       ;; Fold
 ;; 'yasnippet-snippets ;; Official snippets

 ;; ----
 ;; Test
 ;; ----
 )

;;; --------------------------------------------------- PACKAGE NON OFFICIAL --
(add-to-list 'load-path
	     (expand-file-name "nonofficial/doxymacs" user-emacs-directory))
(load "doxymacs.el")


;;; ---------------------------------------------------------------- GENERAL --
;; --------
;; Encoding
;; --------
(set-language-environment "UTF-8")

;; --------------------------
;; Enable all local variables
;; --------------------------
(setq enable-local-variables :all)

;; ----------------
;; Speed startup up
;; ----------------
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq inhibit-startup-screen t)
(setq inhibit-startup-echo-area-message t)

;; ---------------------------------
;; Disable backup file and auto-save
;; ---------------------------------
(setq make-backup-files nil)
(setq backup-by-copying nil)
(setq version-control nil)
(setq delete-old-versions t)
(setq auto-save-default nil)
(setq auto-save-interval 0)

;; ----------------------
;; Disable GUI Components
;; ----------------------
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

;; ---------
;; Auto Pair
;; ---------
(require 'electric)
(electric-pair-mode t)

;; -------------
;; Enable Rulers
;; -------------
(global-linum-mode 1)
(column-number-mode 1)
(line-number-mode 1)

;; -----
;; Theme
;; -----
(load-theme 'cyberpunk t)
(require 'powerline)
(powerline-center-theme)
(global-hl-line-mode t)
(global-hi-lock-mode t)
(diminish 'hi-lock-mode)
(show-paren-mode t)
(diminish 'abbrev-mode)


;; -----
;; Fonts
;; -----
(cond
 ((find-font (font-spec :name "FiraCode"))
  (set-frame-font "FiraCode 18"))
 ((find-font (font-spec :name "Fira Code"))
  (set-frame-font "Fira Code 18"))
 ((find-font (font-spec :name "Ubuntu Mono"))
  (set-frame-font "Ubuntu Mono 18")))



;;; -------------------------------------------------- PLUGIN: CENTER CURSOR --
(require 'centered-cursor-mode)
(diminish 'centered-cursor-mode)
(global-centered-cursor-mode t)


;;; -------------------------------------------------- PLUGIN: COMPANY BASIC --
(require 'company)
(add-hook 'prog-mode-hook #'company-mode)
(diminish 'company-mode)
(setq-default company-idle-delay 0)
(setq-default company-minimum-prefix-length
	      3)
(setq-default company-echo-delay 0)
(setq-default company-tooltip-limit 5)
(setq-default company-begin-commands '(self-insert-command))
(setq-default company-tooltip-align-annotations
	      t)
(setq-default company-tooltip-offset-display
	      'lines)
(setq-default company-tooltip-flip-when-above
	      t)
(setq-default company-dabbrev-code-ignore-case
	      t)
(add-to-list 'completion-styles 'initials
	     t)
(setq-default company-backends '(company-capf company-files company-semantic))


;;; ---------------------------------------------- PLUGIN: COMPANY-QUICKHELP --
(require 'company-quickhelp)
(add-hook 'company-mode-hook #'company-quickhelp-local-mode)
(setq-default company-quickhelp-delay 0)


;;; ------------------------------------------------------ PLUGIN: UNDO-TREE --
(require 'undo-tree)
(global-undo-tree-mode t)
(diminish 'undo-tree-mode)


;;; ------------------------------------------------------ PLUGIN: YASNIPPET --
(require 'yasnippet)
(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)
(diminish 'yas-minor-mode)

;;; ----------------------------------------------------------- PLUGIN: ANZU --
(require 'anzu)
(global-anzu-mode t)
(diminish 'anzu-mode)


;;; ------------------------------------------------------- PLUGIN: FLYCHECK --
(require 'flycheck)
(setq-default flycheck-check-syntax-automatically '(save mode-enabled))
(add-hook 'prog-mode-hook #'flycheck-mode)
(setq-default sentence-end-double-space nil)
(require 'flycheck-pos-tip)
(add-hook 'flycheck-mode-hook #'flycheck-pos-tip-mode)


;;; ------------------------------------------------------------ PLUGIN: IVY --
(require 'ivy)
(require 'counsel)
(require 'swiper)
(ivy-mode 1)
(diminish 'ivy-mode)
(setq-default ivy-use-virtual-buffers t)
(setq-default enable-recursive-minibuffers
	      t)
(setq-default ivy-count-format "(%d/%d) ")
(setq-default ivy-re-builders-alist '((t . ivy--regex-fuzzy)))
(setq-default ivy-use-selectable-prompt t)

;;; ------------------------------------------------------------ PLUGIN: LSP --
(require 'lsp-mode)
(require 'lsp-ui)
(require 'company-lsp)
(add-hook 'lsp-mode-hook #'lsp-ui-mode)
(setq-default company-lsp-async nil)
(setq-default company-lsp-cache-candidates
	      nil)
(add-hook 'lsp-mode-hook
	  #'(lambda ()
	      (add-to-list 'company-backends 'company-lsp)))

;;; ----------------------------------------------------- PLUGIN: PROJECTILE --
(require 'projectile)
(require 'counsel-projectile)
(counsel-projectile-mode)
(setq-default projectile-enable-caching nil)

;;; -------------------------------------------------- PLUGIN: EXPAND-REGION --
(require 'expand-region)


;;; -------------------------------------------------------- PLUGIN: NEOTREE --
(require 'neotree)

;;; -------------------------------------------------- PLUGIN: HUNGRY DELETE --
(require 'hungry-delete)
(global-hungry-delete-mode)
(diminish 'hungry-delete-mode)

;;; ---------------------------------------------- PLUGIN: RAINBOW DELIMITER --
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;;; -------------------------------------------------------- PLUGIN: DIFF HL --
(require 'diff-hl)
(global-diff-hl-mode)

;;; ----------------------------------------------------------- PLUGIN: MWIM --
(require 'mwim)



;;; ------------------------------------------------------ PLUGIN: MIC-PAREN --
(require 'mic-paren)
(paren-activate)
(setq-default paren-match-face 'highlight)
(setq-default paren-sexp-mode t)
(setq-default paren-highlight-offscreen t)


;;; ----------------------------------------------- PLUGIN: WHITESPACE CLEAN --
(require 'whitespace-cleanup-mode)
(add-hook 'prog-mode-hook #'whitespace-cleanup-mode)
(diminish 'whitespace-cleanup-mode)


;;; ------------------------------------------------------- PLUGIN: DIMINISH --
(diminish 'eldoc-mode)

;;; -------------------------------------------------------- CUSTOM FUNCTION --
;; ----------------------
;; Comment Line or Region
;; ----------------------
(defun umkm/comment ()
  "Comment Line or Region."
  (interactive)
  (if (use-region-p)
      (let ((cs (line-beginning-position (+ (- (line-number-at-pos (min (region-beginning)
									(region-end)))
					       (line-number-at-pos (point)))
					    1)))
	    (ce (line-end-position (+ (- (line-number-at-pos (max (region-beginning)
								  (region-end)))
					 (line-number-at-pos (point)))
				      1))))
	(comment-or-uncomment-region cs ce))
    (progn
      (comment-line 1)
      (forward-line -1))))

;;; -------------------------------------------------------------- KEY BINDS --
;; Emacs Global Operation
(bind-key* "M-/"
	   #'(lambda ()
	       (interactive)
	       (find-file (expand-file-name "init.el" user-emacs-directory))))
(bind-key* "C-x C-q" #'kill-emacs)
(bind-key* "C-x C-w" #'kill-this-buffer)
(bind-key* "M-x" #'counsel-M-x)

;; Help
(bind-key* "C-h C-f" #'counsel-describe-function)
(bind-key* "C-h C-v" #'counsel-describe-variable)

;; Find File/Buffer
(bind-key* "M-o" #'find-file-at-point)
(bind-key* "C-x C-f" #'counsel-find-file)
(bind-key* "C-p" #'counsel-ibuffer)
(bind-key* "C-t" #'counsel-imenu)
(bind-key* "C-o" #'projectile-find-file)
(bind-key* "C-x C-o" #'projectile-find-other-file)


;; Undo/Redo Key
(bind-key* "C-z" #'undo-tree-undo)
(bind-key* "C-y" #'undo-tree-redo)

;; Text Operation
(bind-key* "<M-up>" #'move-text-up)
(bind-key* "<M-down>" #'move-text-down)
(bind-key* "C-x C-x" #'whole-line-or-region-kill-region)
(bind-key* "C-x C-c" #'whole-line-or-region-copy-region-as-kill)
(bind-key* "C-x C-v" #'whole-line-or-region-yank)
(bind-key* "C-x C-a" #'mark-whole-buffer)
(bind-key* "C-r" #'anzu-query-replace-regexp)
(bind-key* "C-x C-r" #'anzu-query-replace-at-cursor)
(bind-key* "C-=" #'er/expand-region)
(bind-key* "M-=" #'er/expand-region)

;; Jump
(bind-key* "<home>" #'mwim-beginning-of-code-or-line-or-comment)
(bind-key* "<end>" #'mwim-end-of-line)
(bind-key* "C-g" #'goto-line)
(bind-key* "C-f" #'swiper)
(bind-key* "<f12>"
	   #'(lambda ()
	       (interactive)
	       (if (flycheck-next-error-pos 1)
		   (flycheck-next-error)
		 (flycheck-previous-error))
	       (flycheck-explain-error-at-point)))



;; Comment
(bind-key* "C-/" #'umkm/comment)
(bind-key* "C-_" #'umkm/comment)

;; Clear
(bind-key* "<insert>" #'keyboard-escape-quit)
(bind-key* "<insertchar>" #'keyboard-escape-quit)

;; Panel
(bind-key* "<f8>" #'neotree-toggle)


;;; ------------------------------------------------------- LANGUAGE SUPPORT --
(add-to-list 'load-path
	     (expand-file-name "language" user-emacs-directory))
(load "elisp-lang.el")
(load "cmake-lang.el")
(load "c-lang.el")


;;; ------------------------------------------------------------ NEW PROJECT --
(add-to-list 'load-path
	     (expand-file-name "new-project" user-emacs-directory))
(load "new-project.el")

;;; ------------------------------------------------------------------- TEST --

;;; init.el ends here
