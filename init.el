;; Basic Settings
(add-to-list 'load-path (expand-file-name "elisp" user-emacs-directory))

(require 'package)
;; Package Settings
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://melpa.org/packages/") t)
(package-initialize)

;; General Settings
(require 'init-general)
(require 'init-key)

;; Package Settings
(require 'plug-company)
(require 'plug-ido)
(require 'plug-flycheck)
(require 'plug-hide-show)
(require 'plug-trim-space)
(require 'plug-multi-select)
(require 'plug-yasnippet)

;; Language Support
(require 'sup-elisp)
(require 'sup-elixir)
(require 'sup-rust)
(require 'sup-c)
(require 'sup-python)

(provide 'init)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (flycheck-pyflakes flycheck-pyflasks company-jedi clang-format
													   company-flx cargo flycheck-rust racer
													   multiple-cursors yasnippet alchemist
													   elisp-format indent-guide smex ido-vertical
													   ido-yes-or-no ido-occur undo-tree
													   company-quickhelp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip ((t :inherit default
					   :background "white"
					   :foreground "black")))
 '(company-tooltip-common ((t :inherit font-lock-constant-face)))
 '(company-tooltip-selection ((t :inherit default
								 :background "orange"
								 :foreground "black"))))
