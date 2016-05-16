;;; package --- Summary
;;; Commentary:
;;; Code:

(defvar iedit-toggle-key-default)
(setq iedit-toggle-key-default nil)
(require 'iedit)


(defun iedit-dwim (arg)
  "If ARG, start iedit, using \\[narrow-to-defun] to limit its scope."
  (interactive "P")
  (if arg
      (iedit-mode)
    (save-excursion
      (save-restriction
        (widen)
        ;; this function determines the scope of `iedit-start'.
        (if iedit-mode
            (iedit-done)
          ;; `current-word' can of course be replaced by other
          ;; functions.
          (narrow-to-defun)
          (iedit-start (current-word) (point-min) (point-max)))))))

(global-set-key (kbd "C-;") 'iedit-dwim)

;;; config-iedit ends here
