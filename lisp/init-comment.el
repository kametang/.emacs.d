;;; init-comment.el ---
;;
;; Filename: init-comment.el
;; Description:
;; Author: denny
;; Maintainer:
;; Created: Tue Mar  1 15:17:18 2016 (+0800)
;; Version:
;; Package-Requires: ()
;; Last-Updated:
;;           By:
;;     Update #: 0
;; URL:
;; Doc URL:
;; Keywords:
;; Compatibility:
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or (at
;; your option) any later version.
;;
;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:


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

;; Python
(defun km:python-doc()
  (interactive)
  (move-end-of-line nil)
  (sphinx-doc))

(add-hook 'python-mode-hook (lambda ()
                         (require 'sphinx-doc)
                         (sphinx-doc-mode t)
                         (local-set-key (kbd "C-c C-_") 'km:python-doc)))

(provide 'init-comment)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-comment.el ends here
