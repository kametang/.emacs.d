;;; package --- Summary

;;; Commentary:

;;; Code:
(require 'func-package)

(require-package 'org)

(require 'org)
;; Find Root Directory
(defvar-local
  umkm/root-candidate
  '(".git" ".hg" ".clang_complete" ".dumbjump"))

(defvar umkm/org-dir "~/")
(defvar umkm/org-cur "")

(defun umkm/detect-org-dir()
  "DETECT-ORG-DIR detect org dir."
  (let ((nr nil)
	(cdir buffer-file-name))
    (when (eq cdir nil)
      (setq cdir default-directory))
    (when (not (eq umkm/org-cur cdir))
      (setq umkm/org-cur cdir)
      (dolist (rc umkm/root-candidate)
	(when (eq nr nil)
	  (setq nr (locate-dominating-file cdir rc))))
      (unless (eq nr nil)
	(setq umkm/org-dir nr))
      (setq org-default-notes-file (expand-file-name "Project.org" umkm/org-dir)))))

(defun umkm/org-open()
  "ORG-OPEN open org file."
  (umkm/detect-org-dir)
  (interactive)
  (find-file org-default-notes-file))

(defun umkm/org-capture()
  (umkm/detect-org-dir)
  (interactive)
  (org-capture))

;; Key
(global-set-key (kbd "C-c C-c") 'umkm/org-capture)
(global-set-key (kbd "<f11>") 'umkm/org-open)

;; Org Key
(define-key org-mode-map (kbd "M-n") 'org-insert-heading)

(provide 'plug-org)
;;; plug-org.el ends here
