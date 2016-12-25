;; FlyCheck Global Settings
(require 'func-package)

(require-package 'flycheck)

(require 'flycheck)

(setq-default flycheck-check-syntax-automatically '(save mode-enabled))
(setq-default flycheck-highlighting-mode 'lines)
(setq-default flycheck-display-errors-function 'ignore)
(setq-default flycheck-emacs-lisp-load-path 'inherit)
;; (setq-default flycheck-e

(global-set-key (kbd "<f12>") 
		(lambda() 
		  (interactive) 
		  (flycheck-list-errors) 
		  (other-window 1)))

(define-key flycheck-error-list-mode-map (kbd "RET") 
  (lambda() 
    (interactive) 
    (flycheck-error-list-goto-error) 
    (delete-other-windows)))

;; Provide
(provide 'plug-flycheck)
