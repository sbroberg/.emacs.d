;;; package --- Summary
;;; Commentary:
;;; Code:

(require 'clang-format)
(require 'projectile)

(defcustom my-clang-format-enabled t
  "If t, run clang-format on mm/c/cpp buffers upon saving."
  :group 'clang-format
  :type 'boolean
  :safe 'booleanp)

(defun my-code-style (tool args)
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

(defun my-pep8-buffer()
  "pep-8 style on the buffer"
  (interactive)
  (my-code-style "autopep8" "-a --max-line-length=99 -"))

(defun my-jsbeautify-buffer()
  "beautify the js buffer."
  (interactive)
  (my-code-style "js-beautify" "-i -s2 -j"))

;; hook functions for modes
(defun my-python-settings()
  (local-set-key (kbd "M-i") 'my-pep8-buffer))
(defun my-c-mode-settings()
  (local-set-key (kbd "M-i") 'clang-format-buffer))
(defun my-js-settings()
  (local-set-key (kbd "M-i") 'my-jsbeautify-buffer))

;; register the hooks
(add-hook 'c-mode-common-hook 'my-c-mode-settings)
(add-hook 'python-mode-hook 'my-python-settings)
(add-hook 'js-mode-hook 'my-js-settings)

(defun file-search-upward (directory file)
  "Search DIRECTORY for FILE and return its full path if found, or NIL if not.

If FILE is not found in DIRECTORY, the parent of DIRECTORY will be searched."
  (let ((parent-dir (file-truename (concat (file-name-directory directory) "../")))
        (current-path (if (not (string= (substring directory (- (length directory) 1)) "/"))
                         (concat directory "/" file)
                         (concat directory file))))
    (if (file-exists-p current-path)
        current-path
        (when (and (not (string= (file-truename directory) parent-dir))
                   (< (length parent-dir) (length (file-truename directory))))
          (file-search-upward parent-dir file)))))

;; clang-format-on-save
(defun my-clang-format-before-save ()
  "Usage: (add-hook 'before-save-hook 'clang-format-before-save)."

  (interactive)
  (if (and my-clang-format-enabled (file-search-upward "." ".clang-format"))
      (when (eq major-mode 'c++-mode) (clang-format-buffer))
    (message "my-clang-format-enabled is false"))
  )

(add-hook 'before-save-hook 'my-clang-format-before-save)

;;; config-clang-format ends here
