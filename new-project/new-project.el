;; package --- Summary

;;; Commentary:

;;; Code:

;;; --------------------------------------------------------------- FUNCTION --
(defun umkm/new-project (directory)
  "Create project with type at DIRECTORY."
  (interactive "DProjectRoot?")
  (let ((proj-type (completing-read "Project Type: "
				    (directory-files (expand-file-name "new-project" user-emacs-directory)
						     nil
						     "^[a-zA-Z]+$"))))
    (let ((pt-files (directory-files (expand-file-name (format "new-project/%s" proj-type)
						       user-emacs-directory)
				     nil
				     "...+")))
      (dolist (p-file pt-files)
	(copy-file (expand-file-name p-file
				     (expand-file-name proj-type
						       (expand-file-name "new-project" user-emacs-directory)))
		   (format "%s%s" directory p-file)
		   t))
      (copy-file (expand-file-name ".projectile"
				   (expand-file-name "new-project" user-emacs-directory))
		 (expand-file-name ".projectile" directory)
		 t)))
  (restart-emacs))

;; Provide
(provide 'new-project)
;;; new-project.el ends here
