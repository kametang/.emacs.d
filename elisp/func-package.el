;; Package Functions
(require 'package)

(defun require-package (PACKAGE)
  "Install PACKAGE if not installed yet"
  (if (package-installed-p PACKAGE) t (progn (unless (assoc PACKAGE package-archive-contents)
					       (package-refresh-contents))
					     (package-install PACKAGE)))
  (require PACKAGE))

(provide 'func-package)
