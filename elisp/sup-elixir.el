;; Elixir
(require 'func-package)

(require-package 'alchemist)

(defun local:elixir-load()
  (require 'sup-common)
  (local:common-load)
  (require 'alchemist)
  (alchemist-mode))

(add-hook 'elixir-mode-hook 'local:elixir-load)

;; Provide
(provide 'sup-elixir)
