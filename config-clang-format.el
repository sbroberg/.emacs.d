;;; package --- Summary
;;; Commentary:
;;; Code:

(defcustom clang-format-enabled t
  "If t, run clang-format on mm/c/cpp buffers upon saving."
  :group 'clang-format
  :type 'boolean
  :safe 'booleanp)

(defun code-style (tool args)
  "Enforce code style for TOOL given ARGS."
  (let ((position (point)))
    (progn
      (if (executable-find tool)
          (save-excursion
            (shell-command-on-region
             (point-min) (point-max)
             (format "%s %s" tool args) t t))
        (message (format "can't find %s"  tool))))
    (goto-char position)))
;; invoker for style tools
(defun clang-format-buffer()
  "clang-format buffer"
  (interactive)
  (code-style "clang-format" (concat "-assume-filename=" buffer-file-name)))

(defun pep8-buffer()
  "pep-8 style on the buffer"
  (interactive)
  (code-style "autopep8" "-a --max-line-length=99 -"))

(defun jsbeautify-buffer()
  "beautify the js buffer."
  (interactive)
  (code-style "js-beautify" "-i -s2 -j"))

;; hook functions for modes
(defun my-python-settings()
  (local-set-key (kbd "M-i") 'pep8-buffer))
(defun my-c-mode-settings()
  (local-set-key (kbd "M-i") 'clang-format-buffer))
(defun my-js-settings()
  (local-set-key (kbd "M-i") 'jsbeautify-buffer))

;; register the hooks
(add-hook 'c-mode-common-hook 'my-c-mode-settings)
(add-hook 'python-mode-hook 'my-python-settings)
(add-hook 'js-mode-hook 'my-js-settings)

;; clang-format-on-save
(defun clang-format-before-save ()
  "Usage: (add-hook 'before-save-hook 'clang-format-before-save)."

  (interactive)
  (if clang-format-enabled
      (when (eq major-mode 'c++-mode) (clang-format-buffer))
    (message "clang-format-enabled is false"))
  )

(add-hook 'before-save-hook 'clang-format-before-save)

;;; config-clang-format ends here
