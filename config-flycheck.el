;;; package --- Summary
;;; Commentary:
;;; Code:

(global-flycheck-mode)

;; Show errors as tooltips, but also show full multiline error
;; in status area/minibuffer
(require 'flycheck-tip)
;; (flycheck-tip-use-timer 'verbose)
(setq error-tip-notify-keep-messages t)

;;; config-flycheck ends here
