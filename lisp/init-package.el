;; Package Intstall Tools

(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
	     '("melpa-stable" . "https://melpa.org/packages/") t)
<<<<<<< HEAD
=======
(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)
>>>>>>> aef5241... feat(init): first commit

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(cond ((eq system-type 'windows-nt)
       (unless (package-installed-p 'powershell)
	 (package-install 'powershell)))
      (t (unless (package-installed-p 'shell-pop)
	   (package-install 'shell-pop))))

(dolist (package '(smartparens company yasnippet flycheck helm helm-swoop
<<<<<<< HEAD
			       irony irony-eldoc company-irony
			       company-irony-c-headers flycheck-irony
			       company-jedi flycheck-pyflakes
			       monokai-theme expand-region undo-tree git-gutter
			       markdown-mode js2-mode magit header2))
=======
			       irony irony-eldoc company-irony company-irony-c-headers flycheck-irony
			       company-jedi flycheck-pyflakes
			       monokai-theme expand-region undo-tree))
>>>>>>> aef5241... feat(init): first commit
  (unless (package-installed-p package)
    (package-install package)))

(provide 'init-package)
