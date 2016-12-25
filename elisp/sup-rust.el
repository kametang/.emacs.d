;; Rust
(require 'func-package)

(require-package 'company)
(require-package 'racer)
(require-package 'rust-mode)
(require-package 'electric)
(require-package 'eldoc)
(require-package 'flycheck)
(require-package 'flycheck-rust)
(require-package 'cargo)

(require 'company)
(require 'racer)
(require 'rust-mode)
(require 'electric)
(require 'eldoc)
(require 'flycheck)
(require 'flycheck-rust)
(require 'cargo)

(add-hook 'rust-mode-hook (lambda ()
							(setq racer-cmd "~/.cargo/bin/racer")
							(setq racer-rust-src-path (expand-file-name "rust/src"
																		user-emacs-directory))
							(setq rust-format-on-save t)
							(electric-pair-mode 1)))
(add-hook 'rust-mode-hook 'company-mode)
(add-hook 'racer-mode-hook 'flycheck-rust-setup)
(add-hook 'rust-mode-hook 'racer-mode)
(add-hook 'rust-mode-hook 'cargo-minor-mode)

;; Provide
(provide 'sup-rust)
