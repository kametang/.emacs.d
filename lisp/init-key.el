;; Emacs general key binding

;; Buffer Operations

;; Functions
;; Find File
(defun km:find-file()
  (interactive)
  (call-interactively (if (projectile-project-p)
                          'projectile-find-file
                        'ido-find-file)))
;; Switch buffer
(defun km:switch-buffer()
  (interactive)
  (call-interactively (if (projectile-project-p)
                          'projectile-switch-to-buffer
                        'ido-switch-buffer)))
;; Find other file
(defun km:find-other-file()
  (interactive)
  (call-interactively (if (projectile-project-p)
                          'projectile-find-other-file
                        'ff-find-other-file)))
;; Open init.el
(defun km:config-emacs()
  (interactive)
  (find-file user-init-file))
;; Select current line()
(defun km:mark-line()
  (interactive)
  (progn
    (move-beginning-of-line 1)
    (mark-end-of-sentence 1)))

;; Mapping Start
(key-g "C-w" 'kill-this-buffer)
(key-g "C-x C-q" 'kill-emacs)
(key-g "C-p" 'km:switch-buffer)

;; File Operations
(key-g "C-\\" 'km:find-file)
(key-g "C-o" 'find-file-at-point)
(key-g "C-t" 'km:find-other-file)
(key-g "C-j" 'projectile-switch-project)

;; Content Operations
(key-g "C-x C-a" 'mark-whole-buffer)
(key-g "C-x C-x" 'xah-cut-line-or-region)
(key-g "C-x C-c" 'xah-copy-line-or-region)
(key-g "C-x C-v" 'yank)
(key-g "C-x C-_" 'toggle-comment)
(key-g "C-c C-p" 'mark-paragraph)
(key-g "C-c C-w" 'mark-word)
(key-g "C-c C-l" 'km:mark-line)
(key-g "C-c C-a" 'mark-active)
(key-g "C-f" 'ido-occur)
(key-g "C-g" 'goto-line)
(key-g "RET" 'newline-and-indent)
(key-g "ESC <home>" 'move-text-up)
(key-g "ESC <select>" 'move-text-down)

;; Quick Open
(key-g "M-/" 'km:config-emacs)
(key-g "M-h" 'describe-key)

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
