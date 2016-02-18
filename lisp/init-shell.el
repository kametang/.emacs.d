;; Shell Configure
(add-hook 'term-mode-hook (lambda() (setq yas-dont-activate t)))
(add-hook 'shell-mode-hook 'linum-mode)
(setq kill-buffer-query-functions (delq 'process-kill-buffer-query-function
					kill-buffer-query-functions))

(cond ((eq system-type 'windows-nt)
       (key-g "<C-return>" 'powershell))
      (t (progn
	   (require 'shell-pop)
           (setq shell-file-name "/bin/bash")
	   (key-g "<C-return>" 'shell-pop)
           (key-g "M-RET" 'shell-pop)
	   (setq shell-pop-window-position "full"))))

(provide 'init-shell)