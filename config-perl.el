;;; package --- Summary
;;; Commentary:
;;; Code:

(when (memq window-system '(mac ns))
  (exec-path-from-shell-copy-env "PERL5LIB")
  )

;;; config-perl ends here
