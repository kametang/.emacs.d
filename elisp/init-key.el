;;; package --- Summary

;;; Commentary:

;;; Code:

;; Key
(require 'func-package)

;; Functions
(defun cut-region-or-line()
  (interactive)
  (if (region-active-p)
      (kill-region (region-beginning)
		   (region-end))
    (progn
      (kill-whole-line))))

;; Quick Open init file
(global-set-key (kbd "M-/")
		(lambda()
		  (interactive)
		  (find-file user-init-file)))

;; Encoding Fix
(global-set-key (kbd "<f10>")
		(lambda()
		  (interactive)
		  (set-buffer-file-coding-system 'utf-8-unix)))

;; Map Custom Key
(global-set-key (kbd "C-x C-q") 'kill-emacs)
(global-set-key (kbd "C-\\") 'delete-other-windows)

;; Buffer Operation
(global-set-key (kbd "C-x C-w") 'kill-this-buffer)

;; File Operations
(global-set-key (kbd "M-o") 'find-file-at-point)

;; Content Operations
(global-set-key (kbd "C-x C-a") 'mark-whole-buffer)
(global-set-key (kbd "C-x C-x") 'cut-region-or-line)
(global-set-key (kbd "C-x C-v") 'yank)
(global-set-key (kbd "C-x C-c")
		(lambda()
		  (interactive)
		  (cut-region-or-line)
		  (yank)))
(global-set-key (kbd "C-x C-d")
		(lambda()
		  (interactive)
		  (kill-whole-line)
		  (yank)
		  (yank)
		  (line-move -1)))

;; Undo/Redo
(require-package 'undo-tree)
(global-undo-tree-mode)
(global-set-key (kbd "C-x C-z") 'undo)
(global-set-key (kbd "C-x C-y") 'undo-tree-redo)

;; Position
(global-set-key (kbd "C-e") 'end-of-line)
(global-set-key (kbd "C-q") 'beginning-of-line)
(global-set-key (kbd "<M-home>") 'beginning-of-buffer)
(global-set-key (kbd "ESC <home>") 'beginning-of-buffer)
(global-set-key (kbd "<M-end>") 'end-of-buffer)
(global-set-key (kbd "ESC <end>") 'end-of-buffer)
(global-set-key (kbd "<M-prior>") 'backward-paragraph)
(global-set-key (kbd "<M-next>") 'forward-paragraph)
(global-set-key (kbd "<M-up>")
		(lambda()
		  (interactive)
		  (kill-whole-line)
		  (line-move -1)
		  (move-beginning-of-line 1)
		  (yank)
		  (line-move -1)
		  (move-beginning-of-line 1)))
(global-set-key (kbd "<M-down>")
		(lambda()
		  (interactive)
		  (kill-whole-line)
		  (line-move 1)
		  (move-beginning-of-line 1)
		  (yank)
		  (line-move -1)
		  (move-beginning-of-line 1)))
(global-set-key (kbd "C-g") 'goto-line)

;; Comment
(global-set-key (kbd "C-x C-_")
		(lambda()
		  (interactive)
		  (if (use-region-p)
		      (progn
			(if (= (region-end)
			       (point))
			    (exchange-point-and-mark)
			  t)
			(move-beginning-of-line 1)
			(exchange-point-and-mark)
			(move-end-of-line 1)
			(comment-or-uncomment-region (region-beginning)
						     (region-end)))
		    (progn
		      (move-beginning-of-line 1)
		      (set-mark (point))
		      (move-end-of-line 1)
		      (comment-or-uncomment-region (region-beginning)
						   (region-end))))))

;; ;; Search
;; (require-package 'popup-imenu)
;; (require 'popup-imenu)
;; (global-set-key (kbd "C-f") 'popup-imenu)
;; (define-key popup-isearch-keymap (kbd "C-f") 'popup-isearch-cancel)

;; Smex
;; (require-package 'smex)
;; (require 'smex)
;; (smex-initialize)
;; (global-set-key (kbd "M-x") 'smex)

;; Provide
(provide 'init-key)
;;; init-key.el ends here
