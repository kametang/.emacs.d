;; Shell Configure
(add-hook 'term-mode-hook (lambda() (setq yas-dont-activate t)))
(add-hook 'shell-mode-hook 'linum-mode)
(setq kill-buffer-query-functions (delq 'process-kill-buffer-query-function
					kill-buffer-query-functions))

(cond ((eq system-type 'windows-nt)
       (key-g "M-RET" 'shell))
      (t (progn
           (key-g "M-RET" (lambda ()
                            (interactive)
                            (term "/bin/bash"))))))

;; Auto Close Terminal when no process
(defadvice term-handle-exit
  (after term-kill-buffer-on-exit activate)
  (kill-buffer))

(provide 'init-shell)
