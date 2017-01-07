;; Rust
(require 'func-package)

(require-package 'racer)
(require-package 'rust-mode)
(require-package 'electric)
(require-package 'eldoc)
(require-package 'flycheck-rust)
(require-package 'cargo)

(defun local:rust-load()
  (require 'sup-common)
  (local:common-load)
  (require 'racer)
  (require 'rust-mode)
  (require 'electric)
  (require 'eldoc)
  (require 'flycheck-rust)
  (require 'cargo)
  (setq-default racer-cmd (expand-file-name "../.cargo/bin/racer" user-emacs-directory))
  (setq-default racer-rust-src-path (expand-file-name "rust/src" user-emacs-directory))
  (setq-default rust-format-on-save t)
  (racer-mode)
  (electric-pair-mode 1)
  (flycheck-rust-setup)
  (cargo-minor-mode))


(add-hook 'rust-mode-hook 'local:rust-load)

;; Provide
(provide 'sup-rust)
