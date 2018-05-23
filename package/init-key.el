;;; package --- Summary

;;; Commentary:

;;; Code:

;; Functions
(defun cut-region-or-line()
  (interactive)
  (if (region-active-p)
      (kill-region (region-beginning)
		   (region-end))
    (progn (kill-whole-line))))

;; Quick Open init file
(bind-key*  "M-/" (lambda()
		    (interactive)
		    (find-file user-init-file)))


;; Map Custom Key
(bind-key*  "C-x C-q" 'kill-emacs)
(add-hook 'server-visit-hook (lambda ()
			       (bind-key*  "C-x C-q" (lambda ()
						       (interactive)
						       (mapc 'kill-buffer (buffer-list))))))

;; Buffer Operation
(bind-key*  "C-x C-w" 'kill-this-buffer)

;; File Operations
(bind-key*  "M-o" 'find-file-at-point)

;; Content Operations
(bind-key* "M-DEL" 'backward-kill-word)
(bind-key* "ESC <deletechar>" 'kill-word)

(bind-key*  "C-x C-a" 'mark-whole-buffer)
(bind-key*  "C-x C-x" 'cut-region-or-line)
(bind-key*  "C-x C-v" 'yank)
(bind-key*  "C-x C-c" (lambda()
			(interactive)
			(cut-region-or-line)
			(yank)))


;; Undo/Redo
(use-package
  undo-tree
  :ensure t
  :config (global-undo-tree-mode)
  :bind (("C-z" . undo)))

;; Position
(bind-key*  "C-e" 'end-of-line)
(bind-key*  "C-q" 'beginning-of-line)
(bind-key*  "C-a" 'backward-word)
(bind-key*  "C-d" 'forward-word)

(bind-key*  "<home>" 'beginning-of-line)
(bind-key*  "<select>" 'end-of-line)
(bind-key*  "<end>" 'end-of-line)

(bind-key*  "C-x <home>" 'beginning-of-buffer)
(bind-key*  "C-x <select>" 'end-of-buffer)
(bind-key*  "C-x <end>" 'end-of-buffer)

(defun km-move-line-up()
  "Move current line up"
  (interactive)
  (kill-whole-line)
  (line-move -1)
  (move-beginning-of-line 1)
  (yank)
  (line-move -1)
  (move-beginning-of-line 1))

(defun km-move-line-down()
  "Move current line down"
  (interactive)
  (kill-whole-line)
  (line-move 1)
  (move-beginning-of-line 1)
  (yank)
  (line-move -1)
  (move-beginning-of-line 1))

(bind-key* "C-M-o" 'km-move-line-up)
(bind-key* "ESC <up>" 'km-move-line-up)
(bind-key* "C-M-l" 'km-move-line-down)
(bind-key* "ESC <down>" 'km-move-line-down)

(bind-key*  "C-g" 'goto-line)

;; Comment
(defun umkm:comment()
  "Comment part"
  (interactive)
  (if (use-region-p)
      (progn (if (= (region-end)
		    (point))
		 (exchange-point-and-mark) t)
	     (move-beginning-of-line 1)
	     (exchange-point-and-mark)
	     (move-end-of-line 1)
	     (comment-or-uncomment-region (region-beginning)
					  (region-end)))
    (progn (move-beginning-of-line 1)
	   (set-mark (point))
	   (move-end-of-line 1)
	   (comment-or-uncomment-region (region-beginning)
					(region-end)))))
(bind-key*  "C-/" 'umkm:comment)
(bind-key*  "C-\\" 'umkm:comment)


;; Window
(bind-key*  "<C-tab>" 'other-window)
(bind-key*  "<insert>" 'keyboard-escape-quit)
(bind-key*  "<insertchar>" 'keyboard-escape-quit)

;; Provide
(provide 'init-key)
;;; init-key.el ends here
