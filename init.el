;; Basic Settings
(add-to-list 'load-path (expand-file-name "elisp" user-emacs-directory))

(require 'package)
;; Package Settings
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://melpa.org/packages/") t)
(package-initialize)

;; Time Evaluation
;; (require 'eva-time)

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
(require 'plug-jump)
(require 'plug-ctrlp)

;; Language Support
(require 'sup-common)
(require 'sup-elisp)
(require 'sup-elixir)
(require 'sup-rust)
(require 'sup-c)
(require 'sup-python)
(require 'sup-html)

;; Provide
(provide 'init)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (company-web web-mode flycheck-pyflakes company-jedi
						 flycheck-irony clang-format irony-eldoc
						 company-irony irony cargo flycheck-rust racer
						 alchemist elisp-format fiplr multiple-cursors
						 ethan-wspace flx-ido ido-vertical-mode
						 ido-yes-or-no yasnippet undo-tree smex indent-guide
						 ido-occur flycheck dumb-jump company autopair))))
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
