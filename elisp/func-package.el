;; Package Functions
(require 'package)

(defvar func-package-boot)

(setq-default func-package-boot t)

(defun require-package (PACKAGE)
  "Install PACKAGE if not installed yet."
  (unless (package-installed-p PACKAGE)
    (when (eq func-package-boot t)
      (package-refresh-contents))
    (package-install PACKAGE)))

(provide 'func-package)
