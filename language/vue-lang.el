;; package --- Summary

;;; Commentary:

;;; Code:

;;; ------------------------------------------------------------------- MODE --
(require 'vue-mode)
(setq mmm-submode-decoration-level 2)


;;; -------------------------------------------------------------------- LSP --
(require 'lsp-mode)
(require 'lsp-vue)
;; (add-hook 'vue-mode-hook #'lsp-vue-mmm-enable)


;;; ------------------------------------------------------------------ EMMET --
(require 'emmet-mode)
(add-hook 'vue-mode-hook #'emmet-mode)


;;; ----------------------------------------------------------------- FORMAT --
(require 'prettier-js)
(add-hook 'vue-mode-hook #'prettier-js-mode)
(setq prettier-js-args '("--trailing-comma" "all" "--bracket-spacing"
			 "false"))


;; Provide
(provide 'vue-lang)
;;; vue-lang.el ends here
