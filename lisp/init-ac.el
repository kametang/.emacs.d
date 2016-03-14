;;; init-ac.el ---
;;
;; Filename: init-ac.el
;; Description:
;; Author: denny
;; Maintainer:
;; Created: Fri Feb 26 13:48:27 2016 (+0800)
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


;; Company Configure

(require 'company)
(require 'irony)
(require 'company-irony)

(add-hook 'after-init-hook 'global-company-mode)

(setq company-auto-complete-chars (quote (32 95 40 41 119 46 34 36 39 60 62 47 124 33)))
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)
(setq company-transformers (quote (company-sort-by-occurrence)))

(if (and (>= emacs-major-version 24) (>= emacs-minor-version 4))
    (company-flx-mode +1))

(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'cc-mode-hook 'irony-mode)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(add-hook 'irony-mode-hook 'irony-eldoc)

(if (eq system-type 'windows-nt)
    (setq w32-pipe-read-delay 0))

(require 'jedi-core)
(setq jedi:complete-on-dot t)
(setq jedi:use-shortcuts t)
(setq jedi:tooltip-method 'nil)
(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook (lambda ()
                  (add-to-list 'company-backends 'company-jedi)))


;; Company Color Setting
(let ((class '((class color) (min-color 257)))
      (terminal-class '((class color) (min-colro 89))))
  (custom-set-faces
   `(company-tooltip
     ((t :inherit default
         :background "white"
         :foreground "black")))
   `(company-tooltip-selection
     ((t :inhert font-lock-constant-face
         :foreground "black"
         :background "green")))
   `(company-tooltip-common
     (( t :inherit font-lock-constant-face)))))

(provide 'init-ac)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-ac.el ends here
