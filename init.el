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
 '(custom-safe-themes (quote ("c7a9a68bd07e38620a5508fef62ec079d274475c8f92d75ed0c33c45fbe306bc"
			      default)))
 '(package-selected-packages (quote (autopair smart-tab web-beautify monokai-theme vue-mode
					      company-web company-web-html web-mode emmet-mode fiplr
					      dumb-jump benchmark-init flycheck-irony
					      flycheck-pyflakes flycheck-pyflasks company-jedi
					      clang-format company-flx cargo flycheck-rust racer
					      multiple-cursors yasnippet alchemist elisp-format
					      indent-guide smex ido-vertical ido-yes-or-no ido-occur
					      undo-tree company-quickhelp))))
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
				 :foreground "black")))
 '(web-mode-current-column-highlight-face ((t :inherit default
					      :background "black"
					      :foreground "white")))
 '(web-mode-current-element-highlight-face ((t :inherit default))))
