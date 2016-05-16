;;; package --- Summary
;;; Commentary:
;;; Code:

(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)
(define-key yas-keymap (kbd "<return>") 'yas/exit-all-snippets)

;;; config-yasnippet ends here
