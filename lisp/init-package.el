;; Package Intstall Tools

(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
	     '("melpa-stable" . "https://melpa.org/packages/") t)
(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(cond ((eq system-type 'windows-nt)
       (unless (package-installed-p 'powershell)
	 (package-install 'powershell)))
      (t (unless (package-installed-p 'shell-pop)
	   (package-install 'shell-pop))))

(dolist (package '(smartparens company yasnippet flycheck helm helm-swoop
			       irony irony-eldoc company-irony company-irony-c-headers flycheck-irony
			       company-jedi flycheck-pyflakes
			       monokai-theme expand-region undo-tree))
  (unless (package-installed-p package)
    (package-install package)))

(provide 'init-package)
