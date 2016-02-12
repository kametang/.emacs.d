;; Emacs general key binding

;; Macro for global-set-key
(defmacro key-g (key cmd)
  `(global-set-key (kbd ,key) ,cmd))

;; xah functions
(defun xah-copy-line-or-region ()
  "Copy current line, or text selection.
When called repeatedly, append copy subsequent lines.
When `universal-argument' is called first, copy whole buffer (respects `narrow-to-region').
URL `http://ergoemacs.org/emacs/emacs_copy_cut_current_line.html'
Version 2015-12-30"
  (interactive)
  (let (ξp1 ξp2)
    (if current-prefix-arg
        (setq ξp1 (point-min) ξp2 (point-max))
      (if (use-region-p)
          (setq ξp1 (region-beginning) ξp2 (region-end))
        (setq ξp1 (line-beginning-position) ξp2 (line-end-position))))
    (if (eq last-command this-command)
        (progn
          ;; (push-mark (point) "NOMSG" "ACTIVATE")
          (kill-append "\n" nil)
          (forward-line 1)
          (end-of-line)
          (kill-append (buffer-substring-no-properties (line-beginning-position) (line-end-position)) nil)
          (message "Line copy appended"))
      (progn
        (kill-ring-save ξp1 ξp2)
        (if current-prefix-arg
            (message "Buffer text copied")
          (message "Text copied"))))))

(defun xah-cut-line-or-region ()
  "Cut current line, or text selection.
When `universal-argument' is called first, cut whole buffer (respects `narrow-to-region').
URL `http://ergoemacs.org/emacs/emacs_copy_cut_current_line.html'
Version 2015-06-10"
  (interactive)
  (if current-prefix-arg
      (progn ; not using kill-region because we don't want to include previous kill
        (kill-new (buffer-string))
        (delete-region (point-min) (point-max)))
    (progn (if (use-region-p)
               (kill-region (region-beginning) (region-end) t)
             (kill-region (line-beginning-position) (line-beginning-position 2))))))

;; Buffer Operations
(key-g "C-w" 'kill-this-buffer)
(key-g "C-x C-q" 'kill-emacs)
(key-g "C-p" 'switch-to-buffer)
(key-g "C-\\" 'helm-find-files)

;; Content Operations
(key-g "C-x C-x" 'xah-cut-line-or-region)
(key-g "C-x C-c" 'xah-copy-line-or-region)
(key-g "C-x C-v" 'yank)

(provide 'init-key)
