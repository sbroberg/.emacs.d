;;; package --- Summary
;;; Commentary:
;;; Code:

(if (not (eq system-type 'windows-nt))
  (progn (require 'yasnippet)
  (yas-global-mode 1)
  (define-key yas-keymap (kbd "<return>") 'yas/exit-all-snippets)
))

;;; config-yasnippet ends here
