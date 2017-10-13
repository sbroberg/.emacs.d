;;; package --- Summary
;;; Commentary:
;;; Code:

(require 'python)
(require 'jedi)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(define-key python-mode-map (kbd "M-.")
  (function jedi:goto-definition))
(define-key python-mode-map (kbd "<s-left>")
  (function jedi:goto-definition-pop-marker))

;;; config-python.el ends here
