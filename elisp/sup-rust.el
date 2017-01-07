;;; package --- Summary

;;; Commentary:

;;; Code:

;; Rust
(require 'func-package)

(require-package 'racer)
(require-package 'rust-mode)
(require-package 'eldoc)
(require-package 'flycheck-rust)
(require-package 'cargo)

(require 'sup-common)
(require 'racer)
(require 'rust-mode)
(require 'flycheck-rust)
(require 'cargo)

(setq-default racer-cmd (expand-file-name "../.cargo/bin/racer" user-emacs-directory))
(setq-default racer-rust-src-path (expand-file-name "rust/src" user-emacs-directory))
(setq-default rust-format-on-save t)

(defun local:rust-load()
  (local:common-load)
  (racer-mode)
  (flycheck-rust-setup)
  (cargo-minor-mode))


(add-hook 'rust-mode-hook 'local:rust-load)

;; Provide
(provide 'sup-rust)
;;; sup-rust.el ends here
