;;; package --- Summary
;;; Commentary:
;;; Code:

(require 'python)
(require 'jedi)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(define-key python-mode-map (kbd "M-.")
  (function jedi:goto-definition))

;;; config-python.el ends here
