;; Elixir
(require 'func-package)

(require-package 'alchemist)

(add-hook 'elixir-mode-hook (lambda()
							  (require 'alchemist)
							  (alchemist-mode)))

;; Provide
(provide 'sup-elixir)
