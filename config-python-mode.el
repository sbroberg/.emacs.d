`;;; package --- Summary
;;; Commentary:
;;; Code:

(require 'python-mode)
(require 'projectile)
(require 'python)

(defvar py-shell-switch-buffers-on-execute-p)
(defvar py-split-windows-on-execute-p)
(defvar python-remove-cwd-from-pathc)

(setq python-remove-cwd-from-pathc nil)
                                        ; python-mode
(setq py-install-directory "~/.emacs.d/python-mode-6.0.11")
(add-to-list 'load-path py-install-directory)
(require 'python-mode)

                                        ; use IPython
(setq-default py-shell-name "ipython")
(setq-default py-which-bufname "IPython")
                                        ; use the wx backend, for both mayavi and matplotlib
(setq py-python-command-args
      '("--gui=wx" "--pylab=wx" "-colors" "Linux"))
(setq py-force-py-shell-name-p t)

                                        ; switch to the interpreter after executing code
(setq py-shell-switch-buffers-on-execute-p t)
(setq py-switch-buffers-on-execute-p t)
                                        ; don't split windows
(setq py-split-windows-on-execute-p nil)
                                        ; try to automagically figure out indentation
(setq py-smart-indentation t)

;; set env path for tools like flycheck-pylint
(add-hook 'python-mode-hook
          '(lambda () (setenv "PYTHONPATH" (projectile-project-root))) t)


(defun my-py-execute-buffer ()
  "Send buffer at point to  interpreter. "
  (interactive)
  (let ((wholebuf t)
        (py-master-file (or py-master-file (py-fetch-py-master-file)))
	beg end)
    (when py-master-file
      (let* ((filename (expand-file-name py-master-file))
	     (buffer (or (get-file-buffer filename)
			 (find-file-noselect filename))))
	(set-buffer buffer))))
  (py--execute-prepare (concat "import sys
sys.path.append(\"" (projectile-project-root) "\")
del os
" 'buffer nil  nil nil (point-min) (point-max))))

;;; config-python-mode ends here
