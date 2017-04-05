;;; package --- Summary

;;; Commentary:

;;; Code:


(use-package
  rust-mode
  :ensure t
  :config
  (setq-default rust-format-on-save t))

(use-package
  racer
  :ensure t
  :config (setq-default racer-cmd (expand-file-name "../.cargo/bin/racer" user-emacs-directory))
  (setq-default racer-rust-src-path (expand-file-name "rust/src" user-emacs-directory))
  (add-hook 'rust-mode-hook 'racer-mode))

(use-package
  flycheck-rust
  :ensure t
  :config (add-hook 'rust-mode-hook 'flycheck-rust-setup))

(use-package
  cargo
  :ensure t
  :config (add-hook 'rust-mode-hook 'cargo-minor-mode))

(add-hook 'rust-mode-hook 'local:common-load)

;; Provide
(provide 'sup-rust)
;;; sup-rust.el ends here
