;;; package --- Summary
;;; Commentary:
;;; Code:

(require 'company)
(require 'company-edbi)
(require 'exec-path-from-shell)

(add-to-list 'company-backends 'company-edbi)
(if (eq system-type 'darwin)
    (exec-path-from-shell-copy-env "PERL5LIB")
  )
(setq edbi:completion-tool "none")

;;; config-sql ends here
