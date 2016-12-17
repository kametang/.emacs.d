;;; Package --- Summery
;;; Commentary:
;;; Code:
(require 'package)

(add-to-list 'package-archives
         '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
         '("melpa-stable" . "https://melpa.org/packages/") t)

(defvar-local package-updated nil)
;; Update Package List
(when (not package-archive-contents)
  (setq package-updated t)
  (package-refresh-contents))

;; Install Packages
(dolist (package '(company yasnippet flycheck vue-mode
                   irony ido-occur ido-yes-or-no ido-vertical-mode
                   irony-eldoc company-irony clang-format
                   flycheck-irony flx-ido alchemist
                   flycheck-pyflakes company-flx ethan-wspace
                   monokai-theme expand-region undo-tree
                   markdown-mode js2-mode header2 smex grizzl move-text
                   projectile highlight-symbol indent-guide
                   go-mode company-go))
  (unless (package-installed-p package)
    (progn
      (when (not package-updated)
      ;; if not updated when this times run, refresh contents
        (setq package-updated t)
        (package-refresh-contents))
      (package-install package))))

;; Comapny-jedi install
(if (not (package-installed-p 'company-jedi))
    (progn
      (package-install 'company-jedi)
      (jedi:install-server)))

(provide 'init-package)
;;; init-package.el ends here
