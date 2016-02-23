;;; init-settings.el --- 
;; 
;; Filename: init-settings.el
;; Description: 
;; Author: denny
;; Maintainer: 
;; Created: Tue Feb 23 14:35:39 2016 (+0800)
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


;; Emacs general settings

(if (eq system-type 'windows-nt)
    ;; Windows Server Problem: http://stackoverflow.com/questions/885793/emacs-error-when-calling-server-start
    (server-start))

;; Disable startup splash screen
(setq inhibit-startup-screen t)

;; Disable VC hooks
(setq vc-handled-backends nil)

;; Disable backup files
(setq
 make-backup-files nil
 backup-by-copying nil
 version-control nil
 delete-old-version t
 auto-save-default nil)

;; Remove new line at end of file
(setq mode-require-final-newline nil)

;; Remove menubar, toolbar and scrollbar
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))

;; Set Auto-fill mode
(setq-default fill-column 79)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; Show parens
(show-paren-mode 1)

;; Highlight line
(global-hl-line-mode t)

;; Line Number
(global-linum-mode t)

;; Ruler
(dolist (mode '(column-number-mode line-number-mode))
  (when (fboundp mode) (funcall mode t)))
		
;; Setting English font
(if (member "Input" (font-family-list))
    (set-face-attribute
     'default nil :font "Input 12"))

;; Set folding
(defun hsmode()
  (hs-minor-mode)
  (hs-hide-all))
;;; Hook
(add-hook 'c-mode-hook 'hsmode)
(add-hook 'c++-mode-hook 'hsmode)
(add-hook 'emacs-lisp-mode-hook 'hsmode)
(add-hook 'python-mode-hook 'hsmode)

(setq enable-local-eval t)

(setq warning-minimum-level :emergency)

(provide 'init-settings)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-settings.el ends here
