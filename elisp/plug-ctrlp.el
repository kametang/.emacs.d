;; Ctrlp - fiplr
(require 'func-package)

(require-package 'fiplr)

(require 'fiplr)
(setq-default fiplr-root-markers '(".git" ".clang_complete" ".dumbjump"))
(setq-default fiplr-ignored-globs '((directories (".git" "MDK-ARM" "Utilities" "node_modules"
						  "dist"))
				    (files ("*.jpg" "*.png" "*.zip" "*.~" ".#*" "*.ioc" "*.lnk"))))

(global-set-key (kbd "C-o") 'fiplr-find-file)

;; Provide
(provide 'plug-ctrlp)
