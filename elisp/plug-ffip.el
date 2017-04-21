;; package --- Summary

;;; Commentary:

;;; Code:

(use-package
  find-file-in-project
  :ensure t
  :config (defun local:ffip()
	    (interactive)
	    (cond ((not (eq (ffip-get-project-root-directory) 'nil))
		   (find-file-in-project))
		  ((bound-and-true-p helm-mode)
		   (call-interactively 'helm-find-files))
		  (t (call-interactively 'find-file))))
  :bind (("C-o" . local:ffip)))



;; Provide
(provide 'plug-ffip)
;;; plug-ffip.el ends here
