;;; package --- Summary
;;; Commentary:
;;; Code:

(require 'company)
(require 'exec-path-from-shell)

(if (eq system-type 'darwin)
    (exec-path-from-shell-copy-env "PERL5LIB")
  )
(setq edbi:completion-tool "none")

;;; config-sql ends here
