;; C/C++
(require 'func-package)

(require-package 'company)
(require-package 'irony)
(require-package 'company-irony)
(require-package 'irony-eldoc)
(require-package 'clang-format)

(require 'company)
(require 'clang-format)

(eval-after-load 'c-mode '(add-to-list 'company-backends 'company-irony))
(eval-after-load 'c++-mode '(add-to-list 'company-backends 'company-irony))

(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(add-hook 'irony-mode-hook 'irony-eldoc)
(add-hook 'c-mode-hook (lambda ()
						 (setq-local indent-tabs-mode nil)))
(add-hook 'before-save-hook (lambda()
							  (if (or (eq major-mode 'c-mode)
									  (eq major-mode 'c++-mode))
								  (clang-format-buffer))))

(setq-default tab-width 4)

;; Clang-Format
(setq-default clang-format-executable "clang-format")

(defvar-local
  km-style
  ())

(add-to-list 'km-style "BasedOnStyle: Google")
(add-to-list 'km-style "AccessModifierOffset: 4")
(add-to-list 'km-style "AlignAfterOpenBracket: true")
(add-to-list 'km-style "AlignConsecutiveAssignments: true")
(add-to-list 'km-style "AlignConsecutiveDeclarations: true")
(add-to-list 'km-style "AlignEscapedNewlinesLeft: true")
(add-to-list 'km-style "AlignOperands: true")
(add-to-list 'km-style "AlignTrailingComments: true")
(add-to-list 'km-style "AllowAllParametersOfDeclarationOnNextLine: false")
(add-to-list 'km-style "AllowShortBlocksOnASingleLine: false")
(add-to-list 'km-style "AllowShortCaseLabelsOnASingleLine: false")
(add-to-list 'km-style "AllowShortFunctionsOnASingleLine: Empty")
(add-to-list 'km-style "AllowShortIfStatementsOnASingleLine: false")
(add-to-list 'km-style "AllowShortLoopsOnASingleLine: false")
(add-to-list 'km-style "AlwaysBreakAfterDefinitionReturnType: None")
(add-to-list 'km-style "AlwaysBreakAfterReturnType: None")
(add-to-list 'km-style "AlwaysBreakBeforeMultilineStrings: false")
(add-to-list 'km-style "BinPackArguments: true")
(add-to-list 'km-style "BinPackParameters: true")
(add-to-list 'km-style "ColumnLimit: 100")
(add-to-list 'km-style "ContinuationIndentWidth: 4")
(add-to-list 'km-style "DerivePointerAlignment: true")
(add-to-list 'km-style "IndentCaseLabels: true")
(add-to-list 'km-style "IndentWidth: 4")
(add-to-list 'km-style "Language: Cpp")
(add-to-list 'km-style "MaxEmptyLinesToKeep: 1")
(add-to-list 'km-style "PointerAlignment: Right")
(add-to-list 'km-style "ReflowComments: true")
(add-to-list 'km-style "SortIncludes: false")
(add-to-list 'km-style "SpaceBeforeAssignmentOperators: true")
(add-to-list 'km-style "SpaceBeforeParens: Never")
(add-to-list 'km-style "SpaceInEmptyParentheses: false")
(add-to-list 'km-style "SpacesBeforeTrailingComments: 4")
(add-to-list 'km-style "SpacesInParentheses: false")
(add-to-list 'km-style "SpacesInSquareBrackets: false")
(add-to-list 'km-style "UseTab: Never")

(setq-default clang-format-style (concat "{" (mapconcat 'identity km-style ",") "}"))

;; Provide
(provide 'sup-c)
