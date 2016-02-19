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
(key-g "RET" 'newline-and-indent)

;; Quick Open
(key-g "M-/" '(lambda ()
		(interactive)
		(find-file user-init-file)))

;; Hide/Show Toggle
(key-g "M-q" 'hs-toggle-hiding)

;; Other window
(key-g "<C-escape>" 'delete-other-windows)
(key-g "<C-next>" 'other-window)
(key-g "<M-next>" 'other-window)

;; Date/Time Insert
(key-g "C-c C-d" 'insert-date)
(key-g "C-c C-t" 'insert-time)

;; Increment Search Find Tools
(define-key isearch-mode-map (kbd "ESC <down>") 'isearch-repeat-forward)
(define-key isearch-mode-map (kbd "ESC <up>") 'isearch-repeat-backward)

;; Remapping for tty
(key-g "<select>" 'move-end-of-line)
(key-g "<M-right>" 'forward-word)
(key-g "<M-left>" 'backward-word)
(key-g "ESC <up>" 'backward-paragraph)
(key-g "ESC <down>" 'forward-paragraph)

;; Expand Region
(if (package-installed-p 'expand-region)
    (progn
      (require 'expand-region)
      (key-g "C-=" 'er/expand-region)
      (key-g "M-=" 'er/expand-region)))

(provide 'init-key)
