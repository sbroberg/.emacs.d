;;; package --- Summary
;;; Commentary:
;;; Code:

;; (require 'projectile)
;; (require 'python)
;; (require 'flycheck)
;; (require 'elpy)

;; (if (eq system-type 'gnu/linux)
;;     (setq elpy-rpc-python-command "/usr/bin/python3")
;;   )
;; (if (eq system-type 'darwin)
;;     (setq elpy-rpc-python-command "/usr/local/bin/python3.5")
;;   )
;; (if (eq system-type 'windows-nt)
;;     (setq elpy-rpc-python-command "C:\\Python35\\python.exe")
;;   )

;; (elpy-enable)
;; (elpy-use-ipython)
;; (setq elpy-rpc-backend "jedi")

;; ;; use flycheck not flymake with elpy
;; (when (require 'flycheck nil t)
;;   (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
;;   (add-hook 'elpy-mode-hook 'flycheck-mode))

;; ;; enable autopep8 formatting on save
;; (require 'py-autopep8)
;; (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; (if (eq system-type 'darwin)
;;     (exec-path-from-shell-copy-env "PYTHONPATH")
;;   )
;; (setq py-autopep8-options '("--max-line-length=120"))

(require 'python)
(require 'jedi)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(define-key python-mode-map (kbd "M-.")
  (function jedi:goto-definition))

;;; config-python.el ends here
