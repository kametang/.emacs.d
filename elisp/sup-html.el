;; package --- Summary

;;; Commentary:

;;; Code:
(require 'func-package)

;;; Necessary Package Install (require-package 'xxx)
(require-package 'web-mode)
(require-package 'company-web)

;;; Work
(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.vue?\\'" . web-mode))
(setq-default web-mode-enable-block-face t)
(setq-default web-mode-enable-comment-interpolation t)
(setq-default web-mode-enable-control-block-indentation t)
(setq-default web-mode-enable-css-colorization t)
(setq-default web-mode-enable-current-column-highlight nil)
(setq-default web-mode-enable-current-element-highlight t)
(setq-default web-mode-enable-auto-closing t)

(set-face-foreground 'web-mode-html-tag-face "yellow")
(set-face-background 'web-mode-current-element-highlight-face "pink")
(set-face-foreground 'web-mode-html-attr-name-face "cyan")

(defun local:web-mode()
  (require 'sup-common)
  (local:common-load)
  (require 'company-web-html)
  (require 'company-web-jade)
  (require 'company-web-slim)
  (add-hook 'before-save-hook (lambda()
				(if (eq major-mode 'web-mode)
				    (indent-region (point-min)
						   (point-max))))))

;;; Hook
(add-hook 'web-mode-hook 'local:web-mode)

;; Provide
(provide 'sup-html)
;;; sup-html.el ends here
