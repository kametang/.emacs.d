;; package --- Summary

;;; Commentary:

;;; Code:

(use-package
  cmake-mode
  :ensure t
  :mode (("CMakeLists\\.txt\\'" . cmake-mode)
	 ("\\.cmake\\'" . cmake-mode)))

;; Provide
(provide 'sup-cmake)
;;; sup-cmake.el ends here
