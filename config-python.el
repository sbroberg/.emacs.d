;;; package --- Summary
;;; Commentary:
;;; Code:

(require 'projectile)
(require 'python)
(require 'flycheck)
(require 'elpy)

;; (require 'python-mode)

(setq elpy-rpc-python-command "/usr/local/bin/python3.5")

(elpy-enable)
(elpy-use-ipython)
(setq elpy-rpc-backend "jedi")

;; use flycheck not flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8 formatting on save
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(exec-path-from-shell-copy-env "PYTHONPATH")
(setq py-autopep8-options '("--max-line-length=120"))

;;; config-python.el ends here
