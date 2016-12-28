;; Ctrlp - fiplr
(require 'func-package)

(require-package 'fiplr)

(require 'fiplr)
(setq-default fiplr-root-markers '(".git" ".clang_complete" ".dumbjump"))

(global-set-key (kbd "C-o") 'fiplr-find-file)

;; Provide
(provide 'plug-ctrlp)
