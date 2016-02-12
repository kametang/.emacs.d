;; Shell Configure
(add-hook 'term-mode-hook (lambda() (setq yas-dont-activate t)))
(add-hook 'shell-mode-hook 'linum-mode)
(setq kill-buffer-query-functions (delq 'process-kill-buffer-query-function
					kill-buffer-query-functions))

(cond ((eq system-type 'windows-nt)
       (key-g "<C-return>" 'powershell))
      (t (key-g "<C-return>" 'shell-pop)))

(provide 'init-shell)