;;; package --- Summary
;;; Commentary:
;;; Code:

(use-package
  company
  :diminish (abbrev-mode company-mode)
  :ensure t
  :config (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 3)
  (setq company-echo-delay 0)
  (setq company-tooltip-limit 3)
  (setq company-begin-commands '(self-insert-command))
  (setq company-tooltip-align-annotations t)
  (setq company-tooltip-offset-display 'lines)
  (setq company-tooltip-flip-when-above t)
  (setq-default company-dabbrev-downcase nil)
  (setq-default company-dabbrev-code-ignore-case t)
  (add-to-list 'completion-styles 'initials t)
  ;; (add-hook 'prog-mode-hook (lambda()
  ;; (add-to-list 'company-backends 'company-yasnippet)))
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
		      `(company-tooltip-common ((t :inherit font-lock-constant-face)))))
  :bind (("M-SPC" . company-yasnippet) :map company-active-map ("RET" . company-complete-selection)))


;; (use-package
;;   helm-company
;;   :ensure t
;;   :bind (:map company-mode-map
;; 	      ("M-SPC" . helm-company)
;; 	      :map company-active-map
;; 	      ("M-SPC" . helm-company)))

;; Export
(provide 'plug-company)
;;; plug-company.el ends here
