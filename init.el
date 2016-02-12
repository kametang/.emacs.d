;; Setting Dir
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Emacs general settings
(require 'init-settings)

;; Emacs general key bind
(require 'init-key)

;; Plugins Initialization
(require 'init-package)

;; Helm Configure
(require 'init-helm)

;; Company Configure
(require 'init-ac)

;; Backup Settings
(setq
 backup-by-copying t
 backup-by-directory-alist
 '(("."."~/.saves"))
 delete-old-version t
 kept-new-version 6
 kept-old-version 2
 version-control t)
