;; Company Settings
(require 'func-package)

;; Install packages
(require-package 'company)
(require-package 'company-quickhelp)

;; Require
(require 'company)
(require 'company-quickhelp)

;; Settings
(add-hook 'company-mode-hook (lambda()
			       (company-quickhelp-mode 1)))

(setq company-auto-complete-chars (quote (32 95 40 41 119 46 34 36 39 60 32 47 124 33)))
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)
(setq company-echo-delay 0)
(setq company-tooltip-limit 10)
(setq company-begin-commands '(self-insert-command))
(setq company-tooltip-align-annotations t)

(setq company-quickhelp-delay 0)

(if (eq system-type 'window-nt)
    (setq w32-pipe-read-delay 0))

;; Color
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

;; Export
(provide 'plug-company)
