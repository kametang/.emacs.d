;; Emacs general key binding

;; Buffer Operations
(key-g "C-w" 'kill-this-buffer)
(key-g "C-x C-q" 'kill-emacs)
(key-g "C-p" 'switch-to-buffer)

;; File Operations
(key-g "C-\\" 'helm-find-files)
(key-g "C-o" 'find-file-at-point)

;; Content Operations
(key-g "C-x C-a" 'mark-whole-buffer)
(key-g "C-x C-x" 'xah-cut-line-or-region)
(key-g "C-x C-c" 'xah-copy-line-or-region)
(key-g "C-x C-v" 'yank)
(key-g "C-x C-/" 'toggle-comment)
(key-g "C-g" 'goto-line)

;; Quick Open
(key-g "M-/" '(lambda ()
		(interactive)
		(find-file user-init-file)))

;; Hide/Show Toggle
(key-g "M-q" 'hs-toggle-hiding)

;; Other window
(key-g "<C-escape>" 'delete-other-windows)
(key-g "<C-next>" 'other-window)

(provide 'init-key)
