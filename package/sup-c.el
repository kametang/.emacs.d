;;; package --- Summary
;;; Commentary:

;;; Code:

(use-package
  cquery
  :ensure t
  :config (setq cquery-executable "/usr/local/bin/cquery")
  (setq cquery-extra-args '("--log-file=/tmp/cq.log"))
  (setq cquery-cache-dir "/tmp/cquery-cached")
  (setq cquery-extra-init-params
	'(:index (:comments 2)
		 :completion( :detailedLabel t)
		 :xref (:container t)))
  ;; (cquery-use-default-rainbow-sem-highlight)
  ;; (setq cquery-sem-highlight-method 'overlay)
  (add-hook 'c-mode-hook 'lsp-cquery-enable))

;; (defun km-disable-irony-snippet(snippet-str &optional pos)
;;   (when pos (goto-char pos)))

;; (use-package
;;   irony
;;   :ensure t
;;   :config
;;   ;; (add-hook 'c-mode-common-hook 'irony-mode)
;;   (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
;;   (setq-default irony-snippet--expand-function 'km-disable-irony-snippet))

;; (use-package
;;   irony-eldoc
;;   :ensure t
;;   :config (add-hook 'irony-mode-hook #'irony-eldoc))

;; (use-package
;;   company-irony
;;   :ensure t
;;   :config (add-hook 'irony-mode-hook (lambda()
;; 				       (add-to-list 'company-backends 'company-irony))))


;; (use-package
;;   flycheck-irony
;;   :ensure t
;;   :config (add-hook 'irony-mode-hook #'flycheck-irony-setup))

(use-package
  clang-format
  :ensure t
  :functions read-clang-format-config
  :init
  ;; (defun read-clang-format-config()
  ;; 	  (with-temp-buffer (insert-file-contents (expand-file-name "clang-format.json"
  ;; 								    user-emacs-directory))
  ;; 			    (replace-regexp-in-string "\s+" " " (replace-regexp-in-string "\n" ""
  ;; 											  (buffer-string)))))
  ;; (setq-default clang-format-style (read-clang-format-config))
  (setq-default clang-format-executable "clang-format")
  :config (defun local:c-format()
	    "Format C File"
	    (when (eq major-mode 'c-mode)
	      ;; (align-entire (point-min)
	      ;; (point-max))
	      (clang-format-buffer)))
  (add-hook 'before-save-hook 'local:c-format))

(defun local:c-load()
  (local-set-key (kbd "RET")
		 (lambda()
		   (interactive)
		   (if (or (nth 4 (syntax-ppss))
			   (nth 1 (syntax-ppss)))
		       (c-indent-new-comment-line)
		     (newline))))
  (setq-default doxymacs-doxygen-style "Qt"))

(add-hook 'c-mode-hook 'local:common-load)
(add-hook 'c-mode-hook 'local:c-load)

;; Provide
(provide 'sup-c)
;;; sup-c.el ends here
