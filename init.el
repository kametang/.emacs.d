;; Setting Dir
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

<<<<<<< HEAD
;; Plugins Initialization
(require 'init-package)

;; Emacs general key functions
(require 'init-key-func)

=======
;; Emacs general settings
(require 'init-settings)

;; Emacs general key bind
(require 'init-key)

;; Plugins Initialization
(require 'init-package)

>>>>>>> aef5241... feat(init): first commit
;; Helm Configure
(require 'init-helm)

;; Company Configure
(require 'init-ac)

<<<<<<< HEAD
;; Redo
(require 'init-redo)

;; Shell
(require 'init-shell)

;; Emacs general settings
(require 'init-settings)

;; Emacs general key bind
(require 'init-key)

;; No settings

;; Load theme
(load-theme 'monokai t)

(provide 'init)
=======
;; Backup Settings
(setq
 backup-by-copying t
 backup-by-directory-alist
 '(("."."~/.saves"))
 delete-old-version t
 kept-new-version 6
 kept-old-version 2
 version-control t)
>>>>>>> aef5241... feat(init): first commit
