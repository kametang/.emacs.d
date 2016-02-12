;; Redo configure
(require 'undo-tree)
(global-undo-tree-mode)

(key-g "C-z" 'undo)
(key-g "C-S-z" 'redo)

(provide 'init-redo)