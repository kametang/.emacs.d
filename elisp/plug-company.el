;;; package --- Summary
;;; Commentary:
;;; Code:

(use-package
  company
  :ensure t
  :config (if (eq system-type 'cygwin)
	      (require 'pos-tip))
  (setq company-auto-complete-chars (quote (32 95 40 41 119 46 34 36 39 60 32 47 124 33)))
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1)
  (setq company-echo-delay 0)
  (setq company-tooltip-limit 10)
  (setq company-begin-commands '(self-insert-command))
  (setq company-tooltip-align-annotations t)
  (setq company-tooltip-offset-display 'lines)
  (setq company-tooltip-flip-when-above t)
  (setq-default company-dabbrev-downcase nil)
  (setq-default company-dabbrev-code-ignore-case t)
  (add-to-list 'completion-styles 'initials t)
  (when (boundp 'w32-pipe-read-delay)
    (setq w32-pipe-read-delay 0))
  (when (boundp 'w32-pipe-buffer-size)
    (setq w32-pipe-buffer-size (* 64 1024)))
  (let ((class '((class color)
		 (min-color 257)))
	(terminal-class '((class color)
			  (min-color 89))))
    (custom-set-faces `(company-tooltip ((t :inherit default
					    :background "white"
					    :foreground "black")))
		      `(company-tooltip-selection ((t :inherit default
						      :background "orange"
						      :foreground "black")))
		      `(company-tooltip-common ((t :inherit font-lock-constant-face))))))

(use-package
  helm-company
  :ensure t
  :bind (:map company-mode-map
	      ("M-SPC" . helm-company)
	      :map company-active-map
	      ("M-SPC" . helm-company)))

;; Export
(provide 'plug-company)
;;; plug-company.el ends here
