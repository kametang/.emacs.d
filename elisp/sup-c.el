;;; package --- Summary
;;; Commentary:

;;; Code:

(require 'dom)

(defun local:get-file-path (path name)
  "Get file path by PATH and NAME (accept wildcard)."
  (car (file-expand-wildcards (expand-file-name name path))))

(defun local:load-dom-from-xml(file)
  "LOCAL:C-LOAD-OPTIONS to load options from FILE."
  (if file (with-temp-buffer (insert-file-contents file)
			     (libxml-parse-xml-region (point-min)
						      (point-max))) nil))

(defun dom:fc (dom tag)
  "Find first child of DOM tagged TAG."
  (let* ((tags (dom-by-tag dom tag)))
    (car tags)))

(defun local:c-mdl-root(root)
  "Return ffip root."
  (cons 'ffip-project-root (expand-file-name "." root)))

(defun local:c-mdl-stm-exclude()
  "Return ffip exclude for STM."
  (list "MDK-ARM" "Utilities"))

(defun local:c-mdl-pic-exclude()
  "Return ffip exclude for PIC"
  (list "build" "nbproject" "debug" "dist"))

(defun local:c-make-dir-locals(root)
  "Make .dir-locals.el by ROOT."
  (let* ((targets '("*.c" "*.h")) excludes (ffiproot (local:c-mdl-root (expand-file-name ".."
											 root)))
	 (path (expand-file-name ".." root)) sexp)
    (cond ((string-match-p "/MDK-ARM" root)
	   (setq excludes (local:c-mdl-stm-exclude)))
	  ((string-match-p "/nbproject" root)
	   (setq excludes (local:c-mdl-pic-exclude))))
    (setq sexp (list (list nil (list ffiproot (cons 'ffip-patterns targets)
				     (cons 'ffip-prune-patterns excludes)))))
    (with-temp-buffer (insert (replace-regexp-in-string "^((nil " "((nil . " (format "%S" sexp)))
		      (write-file (expand-file-name ".dir-locals.el" path))
		      (message (format "<ffip>: %s" (expand-file-name ".dir-locals.el" path))))))

(defun local:stm32-keil-inc-path()
  "Return suggested Keil STM32 Include Path."
  (let ((paths (list "c:/Keil_v5/ARM/ARMCC/include"))
	(sugs '()))
    (dolist (sug paths)
      (when (file-exists-p sug)
	(add-to-list 'sugs sug)))
    (let ((rt (completing-read "Choice the include path: " sugs))) rt)))

(defun local:pic-inc-path()
  "Return suggested pic include path."
  (let* ((paths (split-string (getenv "Path") ";"))
	 (sugs '()))
    (dolist (sug paths)
      (when (and (string-match-p "xc\\(8\\|16\\|32\\)\\\\.*\\\\bin" sug)
		 (file-exists-p sug))
	(add-to-list 'sugs sug)))
    (let ((rt (completing-read "Choice used compiler: " sugs)))
      (replace-regexp-in-string "/bin" "/include" (replace-regexp-in-string "\\\\" "/" rt)))))

(defun local:read-stm32-options (path)
  "Read STM32 options from PATH."
  (let* ((opt-content (local:load-dom-from-xml (local:get-file-path path "*.uvprojx")))
	 (stm32opts '()))
    (dolist (target (dom-by-tag (dom:fc opt-content 'Targets) 'Target))
      (when target (let ((topts (dom:fc (dom:fc (dom:fc (dom:fc target 'TargetOption) 'TargetArmAds)
						'Cads) 'VariousControls)))
		     (when topts (dolist (di (split-string (dom-text (dom:fc topts 'Define)) ","))
				   (when di (add-to-list 'stm32opts (format "-D%s" di))))
			   (dolist (ii (split-string (dom-text (dom:fc topts 'IncludePath)) ";"))
			     (when ii (add-to-list 'stm32opts (format "-I%s"
								      (replace-regexp-in-string
								       "^\\.\\./" "" ii)))))))))
    stm32opts))

;; (car (dom-by-tag (local:load-dom-from-xml (local:get-file-path "d:/Proj_Library/Application/MDK-ARM" "*.uvprojx")) 'Targets))

(defun local:c-make-gitignore(root)
  "Make .gitignore for C project by ROOT."
  (let ((fname (cond ((string-match-p "/MDK-ARM" root) "gitignore_stm")
		     ((string-match-p "/nbproject" root) "gitignore_pic")))
	(gname (expand-file-name ".gitignore" (expand-file-name ".." root))))
    (with-temp-buffer (insert-file-contents (expand-file-name (format "elisp/template/%s" fname)
							      user-emacs-directory))
		      (write-file gname)
		      (message (format "<GitIgnore>: %s" gname)))))

(defun local:get-pic-include-path()
  "Provide choose and return PIC include path."
  (let* ((mc-root "c:/Program Files (x86)/Microchip"))
    (if (file-exists-p mc-root)
	(let* ((test-cases '("xc8" "xc16" "xc32"))
	       (shrs '()))
	  (dolist (d test-cases)
	    (let* ((c-root (expand-file-name d mc-root)))
	      (when (file-exists-p c-root)
		(dolist (c (directory-files c-root))
		  (unless (string-match-p "^\\." c)
		    (cond ((string= d "xc8")
			   (add-to-list 'shrs (expand-file-name "include" (expand-file-name c
											    c-root))))
			  ((string= d "xc16")
			   (add-to-list 'shrs (expand-file-name "include" (expand-file-name c
											    c-root))))
			  ((string= d "xc32")
			   (add-to-list 'shrs (expand-file-name "pic32mx/include" (expand-file-name
										   c
										   c-root))))))))))
	  (if shrs (completing-read "Choose PIC Include Path: " shrs) shrs)) nil)))

(defun local:read-pic-options(path)
  "Read PIC options from PATH."
  (let* ((conf-dom (local:load-dom-from-xml (local:get-file-path path "configurations.xml")))
	 (tc (local:get-pic-include-path))
	 (rt '()))
    (let* ((target (dom-text (dom:fc conf-dom 'targetDevice)))
	   (props (mapcar (lambda(x)
			    (dom-attributes x))
			  (dom-by-tag conf-dom 'property))))
      (when tc (add-to-list 'rt (format "-I%s" tc)))
      (add-to-list 'rt (format "-D%s" (replace-regexp-in-string "^PIC" "_" target)))
      (cond ((string-match-p "^PIC18" target)
	     (setq rt (append rt '("-D__PICC18__" "-D__XC8"))))
	    ((string-match-p "^PIC16" target)
	     (setq rt (append rt '("-D__PICC__" "-D__XC8"))))
	    ((string-match-p "^PIC12" target)
	     (setq rt (append rt '("-D__PICC__" "-D__XC8")))))
      (let* ((incs (mapcar (lambda(x)
			     (if (member '(key . "extra-include-directories") x)
				 (cdr (assoc 'value x)) nil)) props)))
	(setq incs (delq nil incs))
	(setq incs (reduce (lambda(x y)
			     (append x y))
			   (mapcar (lambda(x)
				     (split-string x ";")) incs)))
	(setq incs (mapcar (lambda(x)
			     (format "-I%s" x)) incs))
	(setq rt (append rt incs))
	rt))))

(defun local:get-stm32-options(path)
  "LOCAL:GET-STM32-OPTIONS"
  (let ((sopts (local:read-stm32-options path))
	(incpath (local:stm32-keil-inc-path))
	(exclude (local:c-mdl-stm-exclude))
	(dumbjumpfile (expand-file-name ".dumbjump" (expand-file-name ".." path))))
    (with-temp-buffer (dolist (e exclude)
			(insert (format "-%s\n" e)))
		      (insert (format "+%s\n" incpath))
		      (write-file dumbjumpfile))
    (add-to-list 'sopts (format "-I%s" incpath)) sopts))

(defun make-c-project()
  "MAKE-CLANG-COMPLETE generate .clang_complete for STM32 & Microchip friendly."
  (interactive)
  (let ((proj-conf-dir (read-directory-name "Choose (MDK-ARM/nbproject): " ))
	(cc-options '())
	(cc-content))
    (cond ((string-match-p "/MDK-ARM" proj-conf-dir)
	   (setq cc-options (local:get-stm32-options proj-conf-dir)))
	  ((string-match-p "/nbproject" proj-conf-dir)
	   (setq cc-options (local:read-pic-options proj-conf-dir))))
    (when cc-options (add-to-list 'cc-options "-nostdinc")
	  (setq cc-content (mapconcat 'identity cc-options "\n"))
	  (let ((sc-root (expand-file-name ".." proj-conf-dir)))
	    (with-temp-buffer (insert cc-content)
			      (write-file (expand-file-name ".clang_complete" sc-root))
			      (message (format "<ClangComplete>: %s created." (expand-file-name
									       ".clang_complete"
									       sc-root))))))
    (local:c-make-dir-locals proj-conf-dir)
    (local:c-make-gitignore proj-conf-dir)))
;; ))

(use-package
  irony
  :ensure t
  :functions irony-make-clang-complete
  :config (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
  (add-hook 'c-mode-hook 'irony-mode)
  (defun irony-make-c-project()
    (interactive)
    (make-c-project)
    (irony-cdb-autosetup-compile-options))
  :bind ("<f7>" . irony-make-c-project))

(use-package
  irony-eldoc
  :ensure t
  :config (add-hook 'irony-mode-hook 'irony-eldoc))

(use-package
  company-irony
  :ensure t
  :config (setq company-irony-ignore-case t)
  (add-to-list 'company-backends 'company-irony))

(use-package
  flycheck-irony
  :ensure t
  :config (add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

(use-package
  clang-format
  :ensure t
  :functions read-clang-format-config
  :init (defun read-clang-format-config()
	  (with-temp-buffer (insert-file-contents (expand-file-name "clang-format.json"
								    user-emacs-directory))
			    (replace-regexp-in-string "\n" "" (buffer-string))))
  (setq-default clang-format-style (read-clang-format-config))
  (setq-default clang-format-executable "clang-format")
  :config (defun local:c-format()
	    "Format C File"
	    (when (eq major-mode 'c-mode)
	      (align (point-min)
		     (point-max))
	      (clang-format-buffer)))
  (add-hook 'before-save-hook 'local:c-format))

(defun local:c-load()
  (local-set-key (kbd "<C-return>") 'c-indent-new-comment-line)
  (local-set-key (kbd "<f6>")
		 (lambda()
		   (interactive)
		   (insert "fncmt")
		   (call-interactively 'yas-expand)))
  (setq-default doxymacs-doxygen-style "C++"))

(add-hook 'c-mode-hook 'local:common-load)
(add-hook 'c-mode-hook 'local:c-load)

;; Provide
(provide 'sup-c)
;;; sup-c.el ends here
