;; C comment
(defun my-prettify-c-block-comment (orig-fun &rest args)
  (let* ((first-comment-line (looking-back "/\\*\\s-*.*"))
         (star-col-num (when first-comment-line
                         (save-excursion
                           (re-search-backward "/\\*")
                           (1+ (current-column))))))
    (apply orig-fun args)
    (when first-comment-line
      (save-excursion
        (newline)
        (dotimes (cnt star-col-num)
          (insert " "))
        (move-to-column star-col-num)
        (insert "*/"))
      (move-to-column star-col-num) ; comment this line if using bsd style
      (insert "*") ; comment this line if using bsd style
     ))
  ;; Ensure one space between the asterisk and the comment
  (when (not (looking-back " "))
    (insert " ")))
(if (and (>= emacs-major-version 24) (>= emacs-minor-version 4))
    (advice-add 'c-indent-new-comment-line :around #'my-prettify-c-block-comment))
(key-g "<M-return>" 'comment-indent-new-line)

(provide 'init-comment)
