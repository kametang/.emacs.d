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
  (let ((tags (dom-by-tag dom tag)))
    (dom-text (car tags))))


(defun local:stm32-keil-inc-path()
  "Return suggested Keil STM32 Include Path."
  (let ((paths '("c:/Keil_v5/ARM/ARMCC/include"))
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
  (let ((opt-content (local:load-dom-from-xml (local:get-file-path path "*.uvprojx")))
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
    (remove-duplicates stm32opts
		       :test 'string=)))


(defun local:read-pic-options(path)
  "Read PIC options from PATH."
  (let* ((conf-dom (local:load-dom-from-xml (local:get-file-path path "configurations.xml")))
	 (tc-dom (local:load-dom-from-xml (local:get-file-path path "private/configurations.xml")))
	 (rt '()))
    (let* ((target (dom:fc conf-dom 'targetDevice))
	   (tc (replace-regexp-in-string "/bin" "/include" (replace-regexp-in-string "\\\\" "/"
										     (dom:fc tc-dom
											     'languageToolchainDir))))
	   (props (mapcar (lambda(x)
			    (dom-attributes x))
			  (dom-by-tag conf-dom 'property))))
      (add-to-list 'rt (format "-I%s" tc))
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
	(remove-duplicates rt
			   :test 'string=) rt))))

(defun local:get-stm32-options(path)
  "LOCAL:GET-STM32-OPTIONS"
  (let ((sopts (local:read-stm32-options path))
	(incpath (local:stm32-keil-inc-path)))
    (add-to-list 'sopts (format "-I%s" incpath)) sopts))

(defun make-clang-complete()
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
	  (let ((sc-root (read-directory-name "Choose Source Code Root: " (expand-file-name "../"
											    proj-conf-dir))))
	    (with-temp-buffer (insert cc-content)
			      (write-file (expand-file-name ".clang_complete" sc-root))
			      (message (format "%s created." (expand-file-name ".clang_complete"
									       sc-root))))))))
(use-package
  irony
  :ensure t
  :functions irony-make-clang-complete
  :config (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
  (add-hook 'c-mode-hook 'irony-mode)
  (defun irony-make-clang-complete()
    (interactive)
    (make-clang-complete)
    (irony-cdb-autosetup-compile-options))
  :bind ("<f7>" . irony-make-clang-complete))

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
