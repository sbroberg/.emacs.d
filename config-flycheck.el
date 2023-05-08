;;; package --- Summary
;;; Commentary:
;;; Code:

(require 'rtags)
(global-flycheck-mode)

;; Show errors as tooltips, but also show full multiline error
;; in status area/minibuffer
(require 'flycheck-tip)
(setq error-tip-notify-keep-messages t)
(setq flycheck-display-errors-delay 0.2)

;; .cc files (from google) are c++ files.
(add-to-list 'auto-mode-alist '("\\.cc\\'" . c++-mode))

;;; config-flycheck ends here
