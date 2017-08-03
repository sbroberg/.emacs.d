;;; package --- Summary
;;; Commentary:
;;; Code:

(defvar iedit-toggle-key-default)
(setq iedit-toggle-key-default nil)
(require 'iedit)

;; invert the behavior of passing an arg to iedit - by default, it limits scope to
;; function, and is only global if you precede it with M-0
(defun iedit-dwim (arg)
  "If ARG, start iedit, using \\[narrow-to-defun] to limit its scope."
  (interactive "P")
  (if arg
      (iedit-mode)
    (iedit-mode 0)))

(global-set-key (kbd "C-;") 'iedit-dwim)

;;; config-iedit ends here
