;;; Package -- Summery
;;; init-format.el ---
;;
;; Filename: init-format.el
;; Description:
;; Author: denny
;; Maintainer:
;; Created: Tue Feb 23 09:52:35 2016 (+0800)
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


;; C format settings

(setq-default c-default-style "linux")
(setq-default c-basic-offset 4)
(setq-default tab-width 4)

(defun km:notabs ()
  "No Tabs settings."
  (setq-local indent-tabs-mode nil))

(add-hook 'c-mode-common-hook '(lambda() (c-toggle-auto-state 1)))
(add-hook 'c-mode-common-hook 'km:notabs)
(add-hook 'python-mode 'km:notabs)

;; Clang format
(require 'clang-format)

(setq clang-format-executable "clang-format-3.6")

(add-hook 'before-save-hook (lambda ()
                  (if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
                  (clang-format-buffer))))
(provide 'init-format)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-format.el ends here
