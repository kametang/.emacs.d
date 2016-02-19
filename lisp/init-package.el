;;; Package --- Summery
;;; Commentary:
;;; Code:
(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
	     '("melpa-stable" . "https://melpa.org/packages/") t)

(package-initialize)

;; Update Package List
(when (not package-archive-contents)
  (package-refresh-contents))

;; Install Packages
(dolist (package '(smartparens company yasnippet flycheck helm helm-swoop
			       irony irony-eldoc company-irony clang-format
			       company-irony-c-headers flycheck-irony
			       flycheck-pyflakes
			       monokai-theme expand-region undo-tree git-gutter
			       markdown-mode js2-mode header2))
  (unless (package-installed-p package)
    (package-install package)))

;; Magit Version Check
(if (and (>= emacs-major-version 24) (>= emacs-minor-version 4))
    (if (not (package-installed-p 'magit))
	(package-install 'magit)))

;; Comapny-jedi install
(if (not (package-installed-p 'company-jedi))
    (progn
      (package-install 'company-jedi)
      (jedi:install-server)))

(provide 'init-package)
;;; init-package.el ends here
